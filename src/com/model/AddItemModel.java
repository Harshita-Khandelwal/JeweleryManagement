package com.model;

import javax.persistence.Column;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name="items")
public class AddItemModel {
	
	@Id
	@GeneratedValue
	private Integer id;

	@Column(nullable=false,length=50)
		private String itemName="";
	@Column(nullable=false,length=20)
		private String itemCode="";
	@Column(nullable=false,length=20)
		private String itemType="";
		

	public Integer getId() {
		return id;
	}
	public void setId(Integer id) {
		this.id = id;
	}
		public String getItemName() {
			return itemName;
		}
		public void setItemName(String itemName) {
			this.itemName = itemName;
		}
		public String getItemCode() {
			return itemCode;
		}
		public void setItemCode(String itemCode) {
			this.itemCode = itemCode;
		}
		public String getItemType() {
			return itemType;
		}
		public void setItemType(String itemType) {
			this.itemType = itemType;
		}
		
		
}
