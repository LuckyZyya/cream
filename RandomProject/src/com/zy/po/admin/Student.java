package com.zy.po.admin;

import java.util.Date;

import org.springframework.stereotype.Component;

/**
 * 考生实体类
 *
 */
@Component
public class Student {
	
	private Long id;
	private Long subjectId;//所属课程专业ID
	private String name;//登录名
	private String password;//登录密码
	private String trueName;//姓名
	private int ssex;//性别
	private String classinfo;//班级信息

	public Long getId() {
		return id;
	}
	public void setId(Long id) {
		this.id = id;
	}
	public Long getSubjectId() {
		return subjectId;
	}
	public void setSubjectId(Long subjectId) {
		this.subjectId = subjectId;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	public String getTrueName() {
		return trueName;
	}
	public void setTrueName(String trueName) {
		this.trueName = trueName;
	}
	public int getSsex() {
		return ssex;
	}
	public void setSsex(int ssex) {
		this.ssex = ssex;
	}
	public String getClassinfo() {
		return classinfo;
	}
	public void setClassinfo(String classinfo) {
		this.classinfo = classinfo;
	}
	
}
