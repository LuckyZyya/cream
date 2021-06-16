package com.zy.service.admin;

import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Service;

import com.zy.po.admin.Exam;

/**
 * 考试service类
 *
 */
@Service
public interface ExamService {
	public int add(Exam exam);
	public int edit(Exam exam);
	public List<Exam> findList(Map<String, Object> queryMap);
	public int delete(Long id);
	public Integer getTotal(Map<String, Object> queryMap);
	public List<Exam> findListByUser(Map<String, Object> queryMap);
	public Integer getTotalByUser(Map<String, Object> queryMap);
	public Exam findById(Long id);
	public int updateExam(Exam exam);
}
