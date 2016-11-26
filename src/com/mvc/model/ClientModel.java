package com.mvc.model;

public class ClientModel {
	private int clientid;
	private String clientname;
	private String clientmail;
	private long clientphonenumber;
	private String username;
	private String password;
	private String pic;
	private int Gender;
	private int country;
	private int state;
	private int city;
	private String address;
	private int pin;
	private int status;
	
	public String getUsername() {
		return username;
	}
	public void setUsername(String username) {
		this.username = username;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	public String getPic() {
		return pic;
	}
	public void setPic(String pic) {
		this.pic = pic;
	}
	public int getGender() {
		return Gender;
	}
	public void setGender(int gender) {
		Gender = gender;
	}
	public int getStatus() {
		return status;
	}
	public void setStatus(int status) {
		this.status = status;
	}
	public String getClientname() {
		return clientname;
	}
	public void setClientname(String clientname) {
		this.clientname = clientname;
	}
	public long getClientphonenumber() {
		return clientphonenumber;
	}
	public void setClientphonenumber(long clientphonenumber2) {
		this.clientphonenumber = clientphonenumber2;
	}
	public int getCountry() {
		return country;
	}
	public void setCountry(int country) {
		this.country = country;
	}
	public int getState() {
		return state;
	}
	public void setState(int state) {
		this.state = state;
	}
	public String getAddress() {
		return address;
	}
	public void setAddress(String address) {
		this.address = address;
	}
	public int getPin() {
		return pin;
	}
	public void setPin(int pin) {
		this.pin = pin;
	}
	public int getCity() {
		return city;
	}
	public void setCity(int city) {
		this.city = city;
	}
	public int getClientid() {
		return clientid;
	}
	public void setClientid(int clientid) {
		this.clientid = clientid;
	}
	public String getClientmail() {
	    return clientmail;
	}
	public void setClientmail(String clientmail) {
	    this.clientmail = clientmail;
	}
	
}
