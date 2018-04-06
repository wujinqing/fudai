package com.jin.fudai.dto;

/**
 * @author wu.jinqing
 * @date 2018年04月04日
 */
public class MoneyDto {
    /**
     * 大写数字
     */
    private String upperCaseNumber;
    /**
     * 单位
     */
    private String unit;

    public MoneyDto(String upperCaseNumber, String unit) {
        this.upperCaseNumber = upperCaseNumber;
        this.unit = unit;
    }

    public String getUpperCaseNumber() {
        return upperCaseNumber;
    }

    public void setUpperCaseNumber(String upperCaseNumber) {
        this.upperCaseNumber = upperCaseNumber;
    }

    public String getUnit() {
        return unit;
    }

    public void setUnit(String unit) {
        this.unit = unit;
    }
}
