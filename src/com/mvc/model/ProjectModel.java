package com.mvc.model;

import java.sql.Date;

public class ProjectModel {
	private int projectid;
	private String projectname;
	private Date startdate;
	private Date enddate;
	private Date actualcompletedate;
	private String projectdescription;
	private int projectworkstatus;
	private int priority;
	private int clientid;
	private int amount;
	private int mgrid;
	private int status;
	public int getStatus() {
		return status;
	}
	public void setStatus(int status) {
		this.status = status;
	}
	public String getProjectname() {
		return projectname;
	}
	public void setProjectname(String projectname) {
		this.projectname = projectname;
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
	public String getProjectdescription() {
		return projectdescription;
	}
	public void setProjectdescription(String projectdescription) {
		this.projectdescription = projectdescription;
	}
	public int getProjectworkstatus() {
		return projectworkstatus;
	}
	public void setProjectworkstatus(int projectworkstatus) {
		this.projectworkstatus = projectworkstatus;
	}
	public int getPriority() {
		return priority;
	}
	public void setPriority(int priority) {
		this.priority = priority;
	}
	public int getClientid() {
		return clientid;
	}
	public void setClientid(int clientid) {
		this.clientid = clientid;
	}
	public int getAmount() {
		return amount;
	}
	public void setAmount(int amount) {
		this.amount = amount;
	}
	public int getMgrid() {
		return mgrid;
	}
	public void setMgrid(int mgrid) {
		this.mgrid = mgrid;
	}
	public int getProjectid() {
		return projectid;
	}
	public void setProjectid(int projectid) {
		this.projectid = projectid;
	}
	
	

}
