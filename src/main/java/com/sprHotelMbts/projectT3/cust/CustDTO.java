package com.sprHotelMbts.projectT3.cust;

public class CustDTO {

	private String custNo;
	private String custEmail;
	private String custPw;
	private String custName;
	private String custTel;
	private String custRegDate;
	private String custGrade;
	private int custMilage;
	private char custWithdraw;
	private char custAdmin;
	public String getCustNo() {
		return custNo;
	}
	public void setCustNo(String custNo) {
		this.custNo = custNo;
	}
	public String getCustEmail() {
		return custEmail;
	}
	public void setCustEmail(String custEmail) {
		this.custEmail = custEmail;
	}
	public String getCustPw() {
		return custPw;
	}
	public void setCustPw(String custPw) {
		this.custPw = custPw;
	}
	public String getCustName() {
		return custName;
	}
	public void setCustName(String custName) {
		this.custName = custName;
	}
	public String getCustTel() {
		return custTel;
	}
	public void setCustTel(String custTel) {
		this.custTel = custTel;
	}
	public String getCustRegDate() {
		return custRegDate;
	}
	public void setCustRegDate(String custRegDate) {
		this.custRegDate = custRegDate;
	}
	public String getCustGrade() {
		return custGrade;
	}
	public void setCustGrade(String custGrade) {
		this.custGrade = custGrade;
	}
	public int getCustMilage() {
		return custMilage;
	}
	public void setCustMilage(int custMilage) {
		this.custMilage = custMilage;
	}
	public char getCustWithdraw() {
		return custWithdraw;
	}
	public void setCustWithdraw(char custWithdraw) {
		this.custWithdraw = custWithdraw;
	}
	public char getCustAdmin() {
		return custAdmin;
	}
	public void setCustAdmin(char custAdmin) {
		this.custAdmin = custAdmin;
	}
	@Override
	public String toString() {
		return "CustDTO [custNo=" + custNo + ", custEmail=" + custEmail + ", custPw=" + custPw + ", custName="
				+ custName + ", custTel=" + custTel + ", custRegDate=" + custRegDate + ", custGrade=" + custGrade
				+ ", custMilage=" + custMilage + ", custWithdraw=" + custWithdraw + ", custAdmin=" + custAdmin + "]";
	}
	
	
	
}
