package com.zy.po.admin;

import org.springframework.stereotype.Component;

/**
 * 课程专业实体类
 *
 */
@Component
public class Subject {
	
	private Long id;
	private String name;//课程名称
	private String grade;//课程学院
	public Long getId() {
		return id;
	}
	public void setId(Long id) {
		this.id = id;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getGrade() {
		return grade;
	}
	public void setGrade(String grade) {
		this.grade = grade;
	}
	
	
}
