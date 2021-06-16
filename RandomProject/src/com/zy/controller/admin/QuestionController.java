package com.zy.controller.admin;

import java.io.IOException;
import java.io.InputStream;
import java.util.Date;
import java.util.HashMap;
import java.util.Map;

import org.apache.commons.lang.StringUtils;
import org.apache.poi.hssf.usermodel.HSSFRow;
import org.apache.poi.hssf.usermodel.HSSFSheet;
import org.apache.poi.hssf.usermodel.HSSFWorkbook;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.zy.po.admin.Question;
import com.zy.page.admin.Page;
import com.zy.service.admin.QuestionService;
import com.zy.service.admin.SubjectService;

/**
 * 试题管理后台控制器
 *
 */
@RequestMapping("/admin/question")
@Controller
public class QuestionController {
	
	@Autowired
	private QuestionService questionService;
	@Autowired
	private SubjectService subjectService;
	
	/**
	 * 试题列表页面
	 * @param model
	 * @return
	 */
	@RequestMapping(value="/list",method=RequestMethod.GET)
	public ModelAndView list(ModelAndView model){
		Map<String, Object> queryMap = new HashMap<String, Object>();
		queryMap.put("offset", 0);
		queryMap.put("pageSize", 99999);
		model.addObject("subjectList", subjectService.findList(queryMap));
		model.setViewName("question/list");
		return model;
	}
	
	/**
	 * 模糊搜索分页显示列表查询
	 * @param title
	 * @param page
	 * @return
	 */
	@RequestMapping(value="/list",method=RequestMethod.POST)
	@ResponseBody
	public Map<String, Object> list(
			@RequestParam(name="title",defaultValue="") String title,
			@RequestParam(name="questionType",required=false) Integer questionType,
			@RequestParam(name="questionDiffcult",required=false) Integer questionDiffcult,
			@RequestParam(name="subjectId",required=false) Long subjectId,
			Page page
			){
		Map<String, Object> ret = new HashMap<String, Object>();
		Map<String, Object> queryMap = new HashMap<String, Object>();
		queryMap.put("title", title);
		if(questionType != null){
			queryMap.put("questionType", questionType);
		}
		if(questionDiffcult != null){
			queryMap.put("questionDiffcult", questionDiffcult);
		}
		if(subjectId != null){
			queryMap.put("subjectId", subjectId);
		}
		queryMap.put("offset", page.getOffset());
		queryMap.put("pageSize", page.getRows());
		ret.put("rows", questionService.findList(queryMap));
		ret.put("total", questionService.getTotal(queryMap));
		return ret;
	}
	
	/**
	 * 添加试题
	 * @param question
	 * @return
	 */
	@RequestMapping(value="add",method=RequestMethod.POST)
	@ResponseBody
	public Map<String, String> add(Question question){
		Map<String, String> ret = new HashMap<String, String>();
		if(question == null){
			ret.put("type", "error");
			ret.put("msg", "请填写正确的试题信息!");
			return ret;
		}
		if(StringUtils.isEmpty(question.getTitle())){
			ret.put("type", "error");
			ret.put("msg", "请填写试题题目!");
			return ret;
		}
		if(StringUtils.isEmpty(question.getAnswer())){
			ret.put("type", "error");
			ret.put("msg", "请填写试题正确答案!");
			return ret;
		}
//		if(StringUtils.isEmpty(question.getOptA())){
//			ret.put("type", "error");
//			ret.put("msg", "请填写试题选项A!");
//			return ret;
//		}
//		if(StringUtils.isEmpty(question.getOptB())){
//			ret.put("type", "error");
//			ret.put("msg", "请填写试题选项B!");
//			return ret;
//		}
		question.setCreateTime(new Date());
		question.setScoreByType();
		if(questionService.add(question) <= 0){
			ret.put("type", "error");
			ret.put("msg", "添加失败，请联系管理员!");
			return ret;
		}
		ret.put("type", "success");
		ret.put("msg", "添加成功!");
		return ret;
	}
	
	/**
	 * 编辑试题
	 * @param question
	 * @return
	 */
	@RequestMapping(value="edit",method=RequestMethod.POST)
	@ResponseBody
	public Map<String, String> edit(Question question){
		Map<String, String> ret = new HashMap<String, String>();
		if(question == null){
			ret.put("type", "error");
			ret.put("msg", "请填写正确的试题信息!");
			return ret;
		}
		if(StringUtils.isEmpty(question.getTitle())){
			ret.put("type", "error");
			ret.put("msg", "请填写试题题目!");
			return ret;
		}
		if(StringUtils.isEmpty(question.getAnswer())){
			ret.put("type", "error");
			ret.put("msg", "请填写试题正确答案!");
			return ret;
		}
//		if(StringUtils.isEmpty(question.getOptA())){
//			ret.put("type", "error");
//			ret.put("msg", "请填写试题选项A!");
//			return ret;
//		}
//		if(StringUtils.isEmpty(question.getOptB())){
//			ret.put("type", "error");
//			ret.put("msg", "请填写试题选项B!");
//			return ret;
//		}
		question.setScoreByType();
		if(questionService.edit(question) <= 0){
			ret.put("type", "error");
			ret.put("msg", "编辑失败请联系管理员!");
			return ret;
		}
		ret.put("type", "success");
		ret.put("msg", "编辑成功!");
		return ret;
	}
	
	/**
	 * 删除试题
	 * @param id
	 * @return
	 */
	@RequestMapping(value="delete",method=RequestMethod.POST)
	@ResponseBody
	public Map<String, String> delete(Long id){
		Map<String, String> ret = new HashMap<String, String>();
		if(id == null){
			ret.put("type", "error");
			ret.put("msg", "请选择要删除的数据!");
			return ret;
		}
		try {
			if(questionService.delete(id) <= 0){
				ret.put("type", "error");
				ret.put("msg", "删除失败，请联系管理员!");
				return ret;
			}
		} catch (Exception e) {
			// TODO: handle exception
			ret.put("type", "error");
			ret.put("msg", "该试题下存在考试信息，不能删除!");
			return ret;
		}
		
		ret.put("type", "success");
		ret.put("msg", "删除成功!");
		return ret;
	}
	
	/**
	 * 上传文件批量导入试题
	 * @param excelFile
	 * @return
	 */
	@RequestMapping(value="upload_file",method=RequestMethod.POST)
	@ResponseBody
	public Map<String, String> uploadFile(MultipartFile excelFile,Long subjectId){
		Map<String, String> ret = new HashMap<String, String>();
		if(excelFile == null){
			ret.put("type", "error");
			ret.put("msg", "请选择文件!");
			return ret;
		}
		if(subjectId == null){
			ret.put("type", "error");
			ret.put("msg", "请选择所属课程!");
			return ret;
		}
		if(excelFile.getSize() > 5000000){
			ret.put("type", "error");
			ret.put("msg", "文件大小不要超过5M!");
			return ret;
		}
		String suffix = excelFile.getOriginalFilename().substring(excelFile.getOriginalFilename().lastIndexOf(".")+1, excelFile.getOriginalFilename().length());
		if(!"xls,xlsx".contains(suffix)){
			ret.put("type", "error");
			ret.put("msg", "请上传以.xls或.xlsx为后缀的文件!");
			return ret;
		}
		String msg = "导入成功";
		try {
			msg = readExcel(excelFile.getInputStream(),subjectId);
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		if("".equals(msg))msg = "全部导入成功";
		ret.put("type", "success");
		ret.put("msg", msg);
		return ret;
	}
	
	/**
	 * 读取excel文件，并插入到数据库
	 * @param fileInputStream
	 * @return
	 */
	private String readExcel(InputStream fileInputStream,Long subjectId){
		String msg = "";
		try {
			HSSFWorkbook hssfWorkbook = new HSSFWorkbook(fileInputStream);
			HSSFSheet sheetAt = hssfWorkbook.getSheetAt(0);
			if(sheetAt.getLastRowNum() <= 0){
				msg = "该文件为空";
			}
			for(int rowIndex = 1;rowIndex <= sheetAt.getLastRowNum(); rowIndex++){
				Question question = new Question();
				HSSFRow row = sheetAt.getRow(rowIndex);
				if(row.getCell(0) == null){
					msg += "第" + rowIndex + "行试题类型为空已跳过<br/>";
					continue;
				}
				Double numericCellValue = row.getCell(0).getNumericCellValue();
				question.setQuestionType(numericCellValue.intValue());
				if(row.getCell(1) == null){
					msg += "第" + rowIndex + "行试题难度为空已跳过<br/>";
					continue;
				}
				numericCellValue = row.getCell(1).getNumericCellValue();
				question.setQuestionDiffcult(numericCellValue.intValue());
				if(row.getCell(2) == null){
					msg += "第" + rowIndex + "行所属知识点为空已跳过<br/>";
					continue;
				}
				numericCellValue = row.getCell(2).getNumericCellValue();
				question.setQuestionDistribute(numericCellValue.intValue());
				if(row.getCell(3) == null){
					msg += "第" + rowIndex + "行题目为空已跳过<br/>";
					continue;
				}
				question.setTitle(row.getCell(3).getStringCellValue());
				if(row.getCell(4) == null){
					msg += "第" + rowIndex + "行分值为空已跳过<br/>";
					continue;
				}
				numericCellValue = row.getCell(4).getNumericCellValue();
				question.setScore(numericCellValue.intValue());
//				if(row.getCell(3) == null){
//					msg += "第" + rowIndex + "行选项A为空已跳过<br/>";
//					continue;
//				}
//				question.setOptA(row.getCell(3).getStringCellValue());
//				if(row.getCell(4) == null){
//					msg += "第" + rowIndex + "行选项B为空已跳过<br/>";
//					continue;
//				}
//				question.setOptB(row.getCell(4).getStringCellValue());
				question.setOptA(row.getCell(5) == null ? "" : row.getCell(5).getStringCellValue());
				question.setOptB(row.getCell(6) == null ? "" : row.getCell(6).getStringCellValue());
				question.setOptC(row.getCell(7) == null ? "" : row.getCell(7).getStringCellValue());
				question.setOptD(row.getCell(8) == null ? "" : row.getCell(8).getStringCellValue());
				if(row.getCell(9) == null){
					msg += "第" + rowIndex + "行正确答案为空已跳过\n";
					continue;
				}
				question.setAnswer(row.getCell(9).getStringCellValue());
				question.setCreateTime(new Date());
				question.setSubjectId(subjectId);
				if(questionService.add(question) <= 0){
					msg += "第" + rowIndex + "行插入数据库失败\n";
				}
			}
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return msg;
	}
}
