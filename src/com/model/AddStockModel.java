package com.model;

import java.util.Date;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.OneToOne;
import javax.persistence.Table;
import javax.persistence.Transient;

@Entity
@Table(name="stocks")
public class AddStockModel {

	@Id
	@GeneratedValue
	private Integer id=null;
	
	@ManyToOne()
	@JoinColumn(name="itemId",referencedColumnName="id")
	private AddItemModel addItemModel=null;

	@Transient
	private Integer itemId=null;
	
	String itemType="";
	
	private Date dateOfPurchase=null;
	@Column(length=50)
	private String vendorName="";
	private String vendorAddress=null;
	private String billNo="";
	
	private Integer quantity=null;
	
	private Double weight=null;  
	
	private Double ratePerGram=null; 
	
	private Double serviceTax=null;
	private Double vat=null;
	private Double amount=null;
	private Double paidAmount=null;
	private Double  remainingAmount=null;
	private Double anyOtherAmount=null;
	private Double totalAmount=null;
	@Column(length=100)
	private String remarks="";
	
	public Integer getId() {
		return id;
	}
	public void setId(Integer id) {
		this.id = id;
	}
	public AddItemModel getAddItemModel() {
		return addItemModel;
	}
	public void setAddItemModel(AddItemModel addItemModel) {
		this.addItemModel = addItemModel;
	}
	public Integer getItemId() {
		return itemId;
	}
	public void setItemId(Integer itemId) {
		this.itemId = itemId;
	}
	public String getItemType() {
		return itemType;
	}
	public void setItemType(String itemType) {
		this.itemType = itemType;
	}
	public Date getDateOfPurchase() {
		return dateOfPurchase;
	}
	public void setDateOfPurchase(Date dateOfPurchase) {
		this.dateOfPurchase = dateOfPurchase;
	}
	public String getVendorName() {
		return vendorName;
	}
	public void setVendorName(String vendorName) {
		this.vendorName = vendorName;
	}
	public String getVendorAddress() {
		return vendorAddress;
	}
	public void setVendorAddress(String vendorAddress) {
		this.vendorAddress = vendorAddress;
	}
	public String getBillNo() {
		return billNo;
	}
	public void setBillNo(String billNo) {
		this.billNo = billNo;
	}
	public Integer getQuantity() {
		return quantity;
	}
	public void setQuantity(Integer quantity) {
		this.quantity = quantity;
	}
	public Double getWeight() {
		return weight;
	}
	public void setWeight(Double weight) {
		this.weight = weight;
	}
	public Double getRatePerGram() {
		return ratePerGram;
	}
	public void setRatePerGram(Double ratePerGram) {
		this.ratePerGram = ratePerGram;
	}
	public Double getServiceTax() {
		return serviceTax;
	}
	public void setServiceTax(Double serviceTax) {
		this.serviceTax = serviceTax;
	}
	public Double getVat() {
		return vat;
	}
	public void setVat(Double vat) {
		this.vat = vat;
	}
	public Double getAmount() {
		return amount;
	}
	public void setAmount(Double amount) {
		this.amount = amount;
	}
	public Double getPaidAmount() {
		return paidAmount;
	}
	public void setPaidAmount(Double paidAmount) {
		this.paidAmount = paidAmount;
	}
	public Double getRemainingAmount() {
		return remainingAmount;
	}
	public void setRemainingAmount(Double remainingAmount) {
		this.remainingAmount = remainingAmount;
	}
	public Double getAnyOtherAmount() {
		return anyOtherAmount;
	}
	public void setAnyOtherAmount(Double anyOtherAmount) {
		this.anyOtherAmount = anyOtherAmount;
	}
	public Double getTotalAmount() {
		return totalAmount;
	}
	public void setTotalAmount(Double totalAmount) {
		this.totalAmount = totalAmount;
	}
	public String getRemarks() {
		return remarks;
	}
	public void setRemarks(String remarks) {
		this.remarks = remarks;
	}
	
			
}
