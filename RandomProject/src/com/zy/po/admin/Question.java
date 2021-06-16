package com.zy.po.admin;

import java.util.Date;

import org.springframework.stereotype.Component;

/**
 * 试题实体类
 *
 */
@Component
public class Question {
	
	//试题类型定义
	public static int QUESTION_TYPE_SINGLE = 0;//单选题型
	public static int QUESTION_TYPE_MUILT = 1;//多选题型
	public static int QUESTION_TYPE_CHARGE = 2;//判断题型
	public static int QUESTION_TYPE_FILLS = 3;//填空题型
	
	public static int QUESTION__SIMPLE = 0;//简单
	public static int QUESTION__MIDDLE = 1;//中等
	public static int QUESTION__HARD = 2;//困难
	
	
	//试题分值定义，根据试题类型定义分值
	public static int QUESTION_TYPE_SINGLE_SCORE = 2;//单选题型，每题2分
	public static int QUESTION_TYPE_MUILT_SCORE = 4;//多选题型,每题4分
	public static int QUESTION_TYPE_CHARGE_SCORE = 2;//判断题型,每题2分
	public static int QUESTION_TYPE_FILLS_SCORE = 2;//填空题型,每题2分
	
	//试题分值定义，根据试题难度定义分值
//		public static int QUESTION_DIFFCULT_SIMPLE_SCORE = 2;//简单题每题2分
//		public static int QUESTION_DIFFCULT_MIDDLE_SCORE = 4;//中等题每题4分
//		public static int QUESTION_DIFFCULT_HARD_SCORE = 6;//困难题每题6分
	
	
	private Long id;
	private Long subjectId;//课程专业类型
	private int questionType;//试题类型
	private int questionDiffcult;//试题难度
	private int questionDistribute;//试题所属知识点
	private String title;//题目
	private int score;//分值
	private String optA;//选项A
	private String optB;//选项B
	private String optC;//选项C
	private String optD;//选项D
	private String answer;//正确答案
	private Date createTime;//添加时间
	
	
	public int getScore() {
		return score;
	}
	public void setScore(int score) {
		this.score = score;
	}
	public Long getId() {
		return id;
	}
	public void setId(Long id) {
		this.id = id;
	}
	public int getQuestionType() {
		return questionType;
	}
	public void setQuestionType(int questionType) {
		this.questionType = questionType;
	}
	
	public int getQuestionDiffcult() {
		return questionDiffcult;
	}
	public void setQuestionDiffcult(int questionDiffcult) {
		this.questionDiffcult = questionDiffcult;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}

	public String getOptA() {
		return optA;
	}
	public void setOptA(String optA) {
		this.optA = optA;
	}
	public String getOptB() {
		return optB;
	}
	public void setOptB(String optB) {
		this.optB = optB;
	}
	public String getOptC() {
		return optC;
	}
	public void setOptC(String optC) {
		this.optC = optC;
	}
	public String getOptD() {
		return optD;
	}
	public void setOptD(String optD) {
		this.optD = optD;
	}
	public String getAnswer() {
		return answer;
	}
	public void setAnswer(String answer) {
		this.answer = answer;
	}
	public Date getCreateTime() {
		return createTime;
	}
	public void setCreateTime(Date createTime) {
		this.createTime = createTime;
	}
	
	public Long getSubjectId() {
		return subjectId;
	}
	public void setSubjectId(Long subjectId) {
		this.subjectId = subjectId;
	}
	
	public int getQuestionDistribute() {
		return questionDistribute;
	}
	public void setQuestionDistribute(int questionDistribute) {
		this.questionDistribute = questionDistribute;
	}
	/**
	 * 根据试题类型设置分值
	 */
	public void setScoreByType(){
		if(questionType == QUESTION_TYPE_SINGLE)score = QUESTION_TYPE_SINGLE_SCORE;
		if(questionType == QUESTION_TYPE_MUILT)score = QUESTION_TYPE_MUILT_SCORE;
		if(questionType == QUESTION_TYPE_CHARGE)score = QUESTION_TYPE_CHARGE_SCORE;
		if(questionType == QUESTION_TYPE_FILLS)score = QUESTION_TYPE_FILLS_SCORE;
	}
	/**
	 * 根据试题难度设置分值
	 */
//	public void setScoreByDiffcult(){
//		if(questionDiffcult == QUESTION__SIMPLE)score = QUESTION_DIFFCULT_SIMPLE_SCORE;
//		if(questionDiffcult == QUESTION__MIDDLE)score = QUESTION_DIFFCULT_MIDDLE_SCORE;
//		if(questionDiffcult == QUESTION__HARD)score = QUESTION_DIFFCULT_HARD_SCORE;
//	}
}
