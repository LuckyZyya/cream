package com.zy.dao.admin;

import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Repository;

import com.zy.po.admin.Student;

/**
 * 学生dao层
 *
 */
@Repository
public interface StudentDao {
	public int add(Student student);
	public int edit(Student student);
	public List<Student> findList(Map<String, Object> queryMap);
	public int delete(Long id);
	public Integer getTotal(Map<String, Object> queryMap);
	public Student findByName(String name);
}
