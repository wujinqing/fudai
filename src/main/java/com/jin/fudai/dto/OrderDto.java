package com.jin.fudai.dto;

import javax.persistence.Column;

/**
 * @author wu.jinqing
 * @date 2018年04月01日
 */
public class OrderDto {
    private long orderId;
    /**
     * 已付订金
     */
    private long deposit;

    /**
     * 贷款总额
     */
    private long loansPrice;

    public long getOrderId() {
        return orderId;
    }

    public void setOrderId(long orderId) {
        this.orderId = orderId;
    }

    public long getDeposit() {
        return deposit;
    }

    public void setDeposit(long deposit) {
        this.deposit = deposit;
    }

    public long getLoansPrice() {
        return loansPrice;
    }

    public void setLoansPrice(long loansPrice) {
        this.loansPrice = loansPrice;
    }
}
