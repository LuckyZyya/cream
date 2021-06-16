package com.zy.service.admin;

import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Service;

import com.zy.po.admin.Subject;

/**
 * 课程专业service类
 *
 */
@Service
public interface SubjectService {
	public int add(Subject subject);
	public int edit(Subject subject);
	public List<Subject> findList(Map<String, Object> queryMap);
	public int delete(Long id);
	public Integer getTotal(Map<String, Object> queryMap);
	public Subject findById(Long id);
}
