package com.jin.fudai.entity;

import javax.persistence.*;

import static javax.persistence.GenerationType.IDENTITY;

/**
 * 订单详情
 *
 * @author wu.jinqing
 * @date 2018年03月27日
 */
@Entity
@Table(name = "sale_order_detail")
public class SaleOrderDetail {
    @Id
    @GeneratedValue(strategy = IDENTITY)
    @Column(name = "id")
    private long id;

    /**
     * SaleOrderDto.id
     */
    @ManyToOne
    private SaleOrder order;

    /**
     * 订单号: 201803201
     */
    @Column(name = "order_no")
    private String orderNo;

    /**
     * 品名
     */
    @Column(name = "name")
    private String name;

    /**
     * 款式
     */
    @Column(name = "style")
    private String style;

    /**
     * 颜色
     */
    @Column(name = "color")
    private String color;

    /**
     * 单位
     */
    @Column(name = "unit")
    private String unit;

    /**
     * 单价
     */
    @Column(name = "price")
    private long price = 0L;

    /**
     * 数量
     */
    @Column(name = "amount")
    private long amount = 0L;

    /**
     * 原价
     */
    @Column(name = "original_price")
    private long originalPrice = 0L;
    /**
     * 实际支付价格
     */
    @Column(name = "actual_price")
    private long actualPrice = 0L;

    public long getId() {
        return id;
    }

    public void setId(long id) {
        this.id = id;
    }

    public SaleOrder getOrder() {
        return order;
    }

    public void setOrder(SaleOrder order) {
        this.order = order;
    }

    public String getOrderNo() {
        return orderNo;
    }

    public void setOrderNo(String orderNo) {
        this.orderNo = orderNo;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getStyle() {
        return style;
    }

    public void setStyle(String style) {
        this.style = style;
    }

    public String getColor() {
        return color;
    }

    public void setColor(String color) {
        this.color = color;
    }

    public String getUnit() {
        return unit;
    }

    public void setUnit(String unit) {
        this.unit = unit;
    }

    public long getPrice() {
        return price;
    }

    public void setPrice(long price) {
        this.price = price;
    }

    public long getAmount() {
        return amount;
    }

    public void setAmount(long amount) {
        this.amount = amount;
    }

    public long getOriginalPrice() {
        return originalPrice;
    }

    public void setOriginalPrice(long originalPrice) {
        this.originalPrice = originalPrice;
    }

    public long getActualPrice() {
        return actualPrice;
    }

    public void setActualPrice(long actualPrice) {
        this.actualPrice = actualPrice;
    }
}
