package com.zy.service.admin;

import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Service;

import com.zy.po.admin.ExamPaper;

/**
 * 试卷service类
 *
 */
@Service
public interface ExamPaperService {
	public int add(ExamPaper examPaper);
	public int edit(ExamPaper examPaper);
	public List<ExamPaper> findList(Map<String, Object> queryMap);
	public int delete(Long id);
	public Integer getTotal(Map<String, Object> queryMap);
	public List<ExamPaper> findHistory(Map<String, Object> queryMap);
	public Integer getHistoryTotal(Map<String, Object> queryMap);
	public ExamPaper find(Map<String, Object> queryMap);
	public int submitPaper(ExamPaper examPaper);
	public List<Map<String,Object>> getExamStats(Long examId);
}
