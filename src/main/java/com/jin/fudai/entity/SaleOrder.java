package com.jin.fudai.entity;

/**
 * @author wu.jinqing
 * @date 2018年03月20日
 */
public class SaleOrder extends SaleOrderText{
    /**
     * 订单号
     */
    private String orderNo = "201803201";

    /**
     * 客户姓名
     */
    private String customerName = "张三";

    /**
     * 客户联系电话
     */
    private String customerPhoneNumber = "15021083134";

    /**
     * 客户地址
     */
    private String customerAddress = "上海";

    private String date = " 年  月  日";

    private String deposit = "已付订金";

    private String depositUppercase = "已付订金大写";
    private String totalPrice = "货款总额";

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
}
