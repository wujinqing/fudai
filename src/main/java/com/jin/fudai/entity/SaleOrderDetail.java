package com.jin.fudai.entity;

/**
 * 订单详情
 *
 * @author wu.jinqing
 * @date 2018年03月27日
 */
public class SaleOrderDetail {
    private long id;

    private long orderId;

    /**
     * 订单号: 201803201
     */
    private String orderNo;

    /**
     * 品名
     */
    private String name;

    /**
     * 款式
     */
    private String style;

    /**
     * 颜色
     */
    private String color;

    /**
     * 单位
     */
    private String unit;

    /**
     * 单价
     */
    private String price;

    /**
     * 数量
     */
    private String amount;

    /**
     * 总价
     */
    private String priceTotal;

    public long getId() {
        return id;
    }

    public void setId(long id) {
        this.id = id;
    }

    public long getOrderId() {
        return orderId;
    }

    public void setOrderId(long orderId) {
        this.orderId = orderId;
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

    public String getPrice() {
        return price;
    }

    public void setPrice(String price) {
        this.price = price;
    }

    public String getAmount() {
        return amount;
    }

    public void setAmount(String amount) {
        this.amount = amount;
    }

    public String getPriceTotal() {
        return priceTotal;
    }

    public void setPriceTotal(String priceTotal) {
        this.priceTotal = priceTotal;
    }
}
