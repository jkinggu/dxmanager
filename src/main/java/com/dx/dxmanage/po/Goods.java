package com.dx.dxmanage.po;

import java.io.Serializable;

public class Goods implements Serializable{
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	private Integer goodsid;

	private String goodsname;

	private double price;
	
	private String unit;

	private String description;

	public Integer getGoodsid() {
		return goodsid;
	}

	public void setGoodsid(Integer goodsid) {
		this.goodsid = goodsid;
	}

	public String getGoodsname() {
		return goodsname;
	}

	public void setGoodsname(String goodsname) {
		this.goodsname = goodsname == null ? null : goodsname.trim();
	}

	public double getPrice() {
		return price;
	}
	
	public void setPrice(double price) {
		this.price = price;
	}

	public String getUnit() {
		return unit;
	}

	public void setUnit(String unit) {
		this.unit = unit == null ? null : unit.trim();
	}


	public String getDescription() {
		return description;
	}

	public void setDescription(String description) {
		this.description = description == null ? null : description.trim();
	}
	
	

	@Override
	public String toString() {
		return "Goods [goodsid=" + goodsid + ", goodsname=" + goodsname + ", price=" + price + ", describe=" + description
				+ "]";
	}

}