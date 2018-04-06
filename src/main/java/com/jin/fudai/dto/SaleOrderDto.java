package com.jin.fudai.dto;

import com.jin.fudai.entity.SaleOrder;
import com.jin.fudai.entity.SaleOrderDetail;
import com.jin.fudai.util.MoneyTransformHelper;

import java.util.List;

/**
 * @author wu.jinqing
 * @date 2018年03月20日
 */
public class SaleOrderDto extends SaleOrderText{
    /**
     * 订单号
     */
    private String orderNo;

    /**
     * 客户姓名
     */
    private String customerName;

    /**
     * 客户联系电话
     */
    private String customerPhoneNumber = "15021083134";

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
    private List<MoneyDto> depositUppercase;

    /**
     * 货款总额
     */
    private String totalPrice;

    /**
     * 货款总额大写
     */
    private List<MoneyDto> totalPriceUppercase;
    private List<SaleOrderDetail> details;
    public SaleOrderDto(SaleOrder order) {

        this.orderNo  = order.getOrderNo();
        this.customerName  = order.getCustomerName();
        this.customerPhoneNumber  = order.getCustomerPhoneNumber();
        this.customerAddress  = order.getCustomerAddress();
        this.date  = order.getDate();
        this.deposit  = String.valueOf(order.getDeposit());
        this.depositUppercase  = MoneyTransformHelper.toArray(MoneyTransformHelper.toUpperNumber(String.valueOf(order.getDeposit())));
        this.totalPrice  = String.valueOf(order.getLoansPrice());
        this.totalPriceUppercase  = MoneyTransformHelper.toArray(MoneyTransformHelper.toUpperNumber(String.valueOf(order.getLoansPrice())));
        this.details  = order.getDetails();
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

    public List<MoneyDto> getDepositUppercase() {
        return depositUppercase;
    }

    public void setDepositUppercase(List<MoneyDto> depositUppercase) {
        this.depositUppercase = depositUppercase;
    }

    public String getTotalPrice() {
        return totalPrice;
    }

    public void setTotalPrice(String totalPrice) {
        this.totalPrice = totalPrice;
    }

    public List<MoneyDto> getTotalPriceUppercase() {
        return totalPriceUppercase;
    }

    public void setTotalPriceUppercase(List<MoneyDto> totalPriceUppercase) {
        this.totalPriceUppercase = totalPriceUppercase;
    }

    public List<SaleOrderDetail> getDetails() {
        return details;
    }

    public void setDetails(List<SaleOrderDetail> details) {
        this.details = details;
    }
}
