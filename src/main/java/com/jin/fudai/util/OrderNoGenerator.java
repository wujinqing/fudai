package com.jin.fudai.util;

import com.jin.fudai.entity.SaleOrder;

import java.time.LocalDate;
import java.time.format.DateTimeFormatter;

/**
 * @author wu.jinqing
 * @date 2018年04月05日
 */
public class OrderNoGenerator {
    public static String generate(String lastOrderNo)
    {
        String now = LocalDate.now().format(DateTimeFormatter.ofPattern("yyyyMMdd"));
        String orderNo = now + "01";

        if (Assert.notEmpty(lastOrderNo) && lastOrderNo.startsWith(now))
        {
            int oldIdx = Integer.valueOf(lastOrderNo.replaceFirst(now, ""));

            if(oldIdx < 9)
            {
                orderNo = now + "0" + ++oldIdx;
            }else {
                orderNo = now + ++oldIdx;
            }
        }
        return orderNo;
    }

    public static String generate()
    {
        String now = LocalDate.now().format(DateTimeFormatter.ofPattern("yyyyMMdd"));
        String orderNo = now + "01";
        return orderNo;
    }

    public static void main(String[] args) {
        System.out.println(generate("2018040509"));
        System.out.println(LocalDate.now().format(DateTimeFormatter.ofPattern("yyyy年MM月dd日")));
    }
}
