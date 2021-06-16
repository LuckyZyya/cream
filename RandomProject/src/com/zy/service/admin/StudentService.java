package com.zy.service.admin;

import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Service;

import com.zy.po.admin.Student;

/**
 * 考生service类
 *
 */
@Service
public interface StudentService {
	public int add(Student student);
	public int edit(Student student);
	public List<Student> findList(Map<String, Object> queryMap);
	public int delete(Long id);
	public Integer getTotal(Map<String, Object> queryMap);
	public Student findByName(String name);
}
