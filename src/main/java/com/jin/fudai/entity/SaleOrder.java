package com.jin.fudai.entity;

import javax.persistence.*;
import java.util.List;

import static javax.persistence.GenerationType.IDENTITY;

/**
 * @author wu.jinqing
 * @date 2018年03月27日
 */
@Entity
@Table(name = "sale_order")
public class SaleOrder {
    @Id
    @GeneratedValue(strategy = IDENTITY)
    @Column(name = "id")
    private long id;

    /**
     * 订单号: 201803201
     */
    @Column(name = "order_no")
    private String orderNo;

    /**
     * 客户姓名
     */
    @Column(name = "customer_name")
    private String customerName;

    /**
     * 客户联系电话
     */
    @Column(name = "customer_phone_number")
    private String customerPhoneNumber;

    /**
     * 客户地址
     */
    @Column(name = "customer_address")
    private String customerAddress;
    /**
     * 订单日期：2018年3月27号
     */
    @Column(name = "date")
    private String date;

    /**
     * 创建时间
     */
    @Column(name = "crt_dt")
    private long crtDt;

    /**
     * 已付订金
     */
    @Column(name = "deposit")
    private String deposit;

    /**
     * 贷款总额
     */
    @Column(name = "loans_price")
    private String loansPrice;
    /**
     * 原价
     */
    @Column(name = "original_price")
    private String originalPrice;
    /**
     * 实际支付价格
     */
    @Column(name = "actual_price")
    private String actualPrice;


    @OneToMany(mappedBy = "order")
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

    public List<SaleOrderDetail> getDetails() {
        return details;
    }

    public void setDetails(List<SaleOrderDetail> details) {
        this.details = details;
    }

    public long getCrtDt() {
        return crtDt;
    }

    public void setCrtDt(long crtDt) {
        this.crtDt = crtDt;
    }

    public String getLoansPrice() {
        return loansPrice;
    }

    public void setLoansPrice(String loansPrice) {
        this.loansPrice = loansPrice;
    }

    public String getOriginalPrice() {
        return originalPrice;
    }

    public void setOriginalPrice(String originalPrice) {
        this.originalPrice = originalPrice;
    }

    public String getActualPrice() {
        return actualPrice;
    }

    public void setActualPrice(String actualPrice) {
        this.actualPrice = actualPrice;
    }
}
