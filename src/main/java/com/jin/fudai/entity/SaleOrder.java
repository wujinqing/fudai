package com.jin.fudai.entity;

import java.util.List;

/**
 * @author wu.jinqing
 * @date 2018年03月27日
 */
public class SaleOrder {
    private long id;

    /**
     * 订单号: 201803201
     */
    private String orderNo;

    /**
     * 客户姓名
     */
    private String customerName;

    /**
     * 客户联系电话
     */
    private String customerPhoneNumber;

    /**
     * 客户地址
     */
    private String customerAddress;
    /**
     * 订单日期：2018年3月27号
     */
    private String date;

    /**
     * 已付订金
     */
    private String deposit;

    /**
     * 已付订金大写
     */
    private String depositUppercase;

    /**
     * 已付订金大写
     */
    private String totalPrice;

    private List<SaleOrderDetail> details;

    public long getId() {
        return id;
    }

    public void setId(long id) {
        this.id = id;
    }

    public String getOrderNo() {
        return orderNo;
    }

    public void setOrderNo(String orderNo) {
        this.orderNo = orderNo;
    }

    public String getCustomerName() {
        return customerName;
    }

    public void setCustomerName(String customerName) {
        this.customerName = customerName;
    }

    public String getCustomerPhoneNumber() {
        return customerPhoneNumber;
    }

    public void setCustomerPhoneNumber(String customerPhoneNumber) {
        this.customerPhoneNumber = customerPhoneNumber;
    }

    public String getCustomerAddress() {
        return customerAddress;
    }

    public void setCustomerAddress(String customerAddress) {
        this.customerAddress = customerAddress;
    }

    public String getDate() {
        return date;
    }

    public void setDate(String date) {
        this.date = date;
    }

    public String getDeposit() {
        return deposit;
    }

    public void setDeposit(String deposit) {
        this.deposit = deposit;
    }

    public String getDepositUppercase() {
        return depositUppercase;
    }

    public void setDepositUppercase(String depositUppercase) {
        this.depositUppercase = depositUppercase;
    }

    public String getTotalPrice() {
        return totalPrice;
    }

    public void setTotalPrice(String totalPrice) {
        this.totalPrice = totalPrice;
    }

    public List<SaleOrderDetail> getDetails() {
        return details;
    }

    public void setDetails(List<SaleOrderDetail> details) {
        this.details = details;
    }
}
