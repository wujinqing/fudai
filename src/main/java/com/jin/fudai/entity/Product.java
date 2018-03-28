package com.jin.fudai.entity;

import javax.persistence.*;

import static javax.persistence.GenerationType.IDENTITY;

/**
 * 产品
 *
 * @author wu.jinqing
 * @date 2018年03月23日
 */
@Entity
@Table(name = "product")
public class Product {
    @Id
    @GeneratedValue(strategy = IDENTITY)
    @Column(name = "id")
    private long id;

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
    private String price;

    public long getId() {
        return id;
    }

    public void setId(long id) {
        this.id = id;
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
}
