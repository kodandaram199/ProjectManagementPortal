package com.mvc.model;

import java.sql.Date;

public class TaskModel {

	private int taskid;
	private String taskname;
	private String taskdescription;
	private Date startdate;
	private Date enddate;
	private Date actualcompletedate;
	private int priority;
	private int taskstatus;
	private int employeeid;
	private int status;
	private int projectid;
	
	public String getTaskname() {
		return taskname;
	}
	public void setTaskname(String taskname) {
		this.taskname = taskname;
	}
	public Date getStartdate() {
		return startdate;
	}
	public void setStartdate(Date startdate) {
		this.startdate = startdate;
	}
	public Date getEnddate() {
		return enddate;
	}
	public void setEnddate(Date enddate) {
		this.enddate = enddate;
	}
	public Date getActualcompletedate() {
		return actualcompletedate;
	}
	public void setActualcompletedate(Date actualcompletedate) {
		this.actualcompletedate = actualcompletedate;
	}
	public int getPriority() {
		return priority;
	}
	public void setPriority(int priority) {
		this.priority = priority;
	}
	public int getTaskstatus() {
		return taskstatus;
	}
	public void setTaskstatus(int taskstatus) {
		this.taskstatus = taskstatus;
	}
	public int getEmployeeid() {
		return employeeid;
	}
	public void setEmployeeid(int userid) {
		this.employeeid = userid;
	}
	public int getStatus() {
		return status;
	}
	public void setStatus(int status) {
		this.status = status;
	}
	public int getProjectid() {
		return projectid;
	}
	public void setProjectid(int projectid) {
		this.projectid = projectid;
	}
	public String getTaskdescription() {
		return taskdescription;
	}
	public void setTaskdescription(String taskdescription) {
		this.taskdescription = taskdescription;
	}
	public int getTaskid() {
		return taskid;
	}
	public void setTaskid(int taskid) {
		this.taskid = taskid;
	}
	
	
}
