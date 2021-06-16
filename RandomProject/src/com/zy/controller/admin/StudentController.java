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
import org.apache.poi.ss.usermodel.Cell;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.zy.po.admin.Question;
import com.zy.po.admin.Student;
import com.zy.page.admin.Page;
import com.zy.service.admin.StudentService;
import com.zy.service.admin.SubjectService;

/**
 * 学生管理后台控制器
 *
 */
@RequestMapping("/admin/student")
@Controller
public class StudentController {
	
	@Autowired
	private StudentService studentService;
	@Autowired
	private SubjectService subjectService;
	
	/**
	 * 学生列表页面
	 * @param model
	 * @return
	 */
	@RequestMapping(value="/list",method=RequestMethod.GET)
	public ModelAndView list(ModelAndView model){
		Map<String, Object> queryMap = new HashMap<String, Object>();
		queryMap.put("offset", 0);
		queryMap.put("pageSize", 99999);
		model.addObject("subjectList", subjectService.findList(queryMap));
		model.setViewName("student/list");
		return model;
	}
	
	/**
	 * 模糊搜索分页显示列表查询
	 * @param name
	 * @param page
	 * @return
	 */
	@RequestMapping(value="/list",method=RequestMethod.POST)
	@ResponseBody
	public Map<String, Object> list(
			@RequestParam(name="name",defaultValue="") String name,
			@RequestParam(name="subjectId",required=false) Long subjectId,
			Page page
			){
		Map<String, Object> ret = new HashMap<String, Object>();
		Map<String, Object> queryMap = new HashMap<String, Object>();
		queryMap.put("name", name);
		if(subjectId != null){
			queryMap.put("subjectId", subjectId);
		}
		queryMap.put("offset", page.getOffset());
		queryMap.put("pageSize", page.getRows());
		ret.put("rows", studentService.findList(queryMap));
		ret.put("total", studentService.getTotal(queryMap));
		return ret;
	}
	
	/**
	 * 添加学生
	 * @param student
	 * @return
	 */
	@RequestMapping(value="add",method=RequestMethod.POST)
	@ResponseBody
	public Map<String, String> add(Student student){
		Map<String, String> ret = new HashMap<String, String>();
		if(student == null){
			ret.put("type", "error");
			ret.put("msg", "请填写正确的学生信息!");
			return ret;
		}
		if(StringUtils.isEmpty(student.getName())){
			ret.put("type", "error");
			ret.put("msg", "请填写学生用户名!");
			return ret;
		}
		if(StringUtils.isEmpty(student.getPassword())){
			ret.put("type", "error");
			ret.put("msg", "请填写学生密码!");
			return ret;
		}
		if(StringUtils.isEmpty(student.getTrueName())){
			ret.put("type", "error");
			ret.put("msg", "请填写学生真实姓名!");
			return ret;
		}
//		if(StringUtils.isEmpty(student.getSsex())){
//			ret.put("type", "error");
//			ret.put("msg", "请填写学生性别!");
//			return ret;
//		}
		if(StringUtils.isEmpty(student.getClassinfo())){
			ret.put("type", "error");
			ret.put("msg", "请填写学生班级信息!");
			return ret;
		}
		if(student.getSubjectId() == null){
			ret.put("type", "error");
			ret.put("msg", "请选择学生所属课程专业!");
			return ret;
		}
//		student.setCreateTime(new Date());
		//添加之前判断登录名是否存在
		if(isExistName(student.getName(), -1l)){
			ret.put("type", "error");
			ret.put("msg", "该登录账号已经存在!");
			return ret;
		}
		if(studentService.add(student) <= 0){
			ret.put("type", "error");
			ret.put("msg", "添加失败请联系管理员!");
			return ret;
		}
		ret.put("type", "success");
		ret.put("msg", "添加成功!");
		return ret;
	}
	
	/**
	 * 编辑学生
	 * @param student
	 * @return
	 */
	@RequestMapping(value="edit",method=RequestMethod.POST)
	@ResponseBody
	public Map<String, String> edit(Student student){
		Map<String, String> ret = new HashMap<String, String>();
		if(student == null){
			ret.put("type", "error");
			ret.put("msg", "请填写正确的课程信息!");
			return ret;
		}
		if(StringUtils.isEmpty(student.getName())){
			ret.put("type", "error");
			ret.put("msg", "请填写学生用户名!");
			return ret;
		}
		if(StringUtils.isEmpty(student.getPassword())){
			ret.put("type", "error");
			ret.put("msg", "请填写学生密码!");
			return ret;
		}
		if(StringUtils.isEmpty(student.getTrueName())){
			ret.put("type", "error");
			ret.put("msg", "请填写学生真实姓名!");
			return ret;
		}
//		if(student.getSsex()== null){
//			ret.put("type", "error");
//			ret.put("msg", "请填写学生性别!");
//			return ret;
//		}
		if(StringUtils.isEmpty(student.getClassinfo())){
			ret.put("type", "error");
			ret.put("msg", "请填写学生班级信息!");
			return ret;
		}
		if(student.getSubjectId() == null){
			ret.put("type", "error");
			ret.put("msg", "请选择学生所属课程专业!");
			return ret;
		}
		
		//编辑之前判断登录名是否存在
		if(isExistName(student.getName(), student.getId())){
			ret.put("type", "error");
			ret.put("msg", "该登录账号已经存在!");
			return ret;
		}
		if(studentService.edit(student) <= 0){
			ret.put("type", "error");
			ret.put("msg", "编辑失败，请联系管理员!");
			return ret;
		}
		ret.put("type", "success");
		ret.put("msg", "编辑成功!");
		return ret;
	}
	
	/**
	 * 删除学生
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
			if(studentService.delete(id) <= 0){
				ret.put("type", "error");
				ret.put("msg", "删除失败，请联系管理员!");
				return ret;
			}
		} catch (Exception e) {
			// TODO: handle exception
			ret.put("type", "error");
			ret.put("msg", "该学生下存在考试信息，不能删除!");
			return ret;
		}
		
		ret.put("type", "success");
		ret.put("msg", "删除成功!");
		return ret;
	}
	
	/**
	 * 判断用户名是否存在
	 * @param name
	 * @param id
	 * @return
	 */
	private boolean isExistName(String name,Long id){
		Student student = studentService.findByName(name);
		if(student == null)return false;
		if(student.getId().longValue() == id.longValue())return false;
		return true;
	}
	
	
	
	/**
	 * 上传文件批量导入学生信息
	 * @param excelFile
	 * @return
	 */
	@RequestMapping(value="upload_stufile",method=RequestMethod.POST)
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
				Student student = new Student();
				HSSFRow row = sheetAt.getRow(rowIndex);
				if(row.getCell(0) == null){
					msg += "第" + rowIndex + "行学号为空已跳过<br/>";
					continue;
				}
				row.getCell(0).setCellType(Cell.CELL_TYPE_STRING);
				student.setName(row.getCell(0).getStringCellValue());
				if(row.getCell(1) == null){
					msg += "第" + rowIndex + "行密码为空已跳过<br/>";
					continue;
				}
				student.setPassword(row.getCell(1).getStringCellValue());
				if(row.getCell(2) == null){
					msg += "第" + rowIndex + "行真实姓名为空已跳过<br/>";
					continue;
				}
                student.setTrueName(row.getCell(2).getStringCellValue());
				if(row.getCell(3) == null){
					msg += "第" + rowIndex + "行性别为空已跳过<br/>";
					continue;
				}
				Double numericCellValue = row.getCell(3).getNumericCellValue();
				student.setSsex(numericCellValue.intValue());
				if(row.getCell(4) == null){
					msg += "第" + rowIndex + "行班级信息为空已跳过\n";
					continue;
				}
				student.setClassinfo(row.getCell(4).getStringCellValue());
				student.setSubjectId(subjectId);
				if(studentService.add(student) <= 0){
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
