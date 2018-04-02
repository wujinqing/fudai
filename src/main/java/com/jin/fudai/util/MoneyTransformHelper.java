package com.jin.fudai.util;

import com.jin.fudai.consts.MoneyUnit;

import java.util.regex.Pattern;

/**
 * 货币转换
 *
 * @author wu.jinqing
 * @date 2018年03月20日
 */
public class MoneyTransformHelper {

    public static String toUpperNumber(int number)
    {
        return toUpperNumber(String.valueOf(number));
    }

    /**
     *  货币转大写
     *
     * @param number 12345
     * @return 壹万贰仟叁佰肆拾伍元
     */
    public static String toUpperNumber(String number)
    {
        char[] numbers = numberToArray(number);

        StringBuilder sb = new StringBuilder();
        int len = numbers.length;

        for(int i = 0; i < numbers.length; i++)
        {
            char c = numbers[i];

            int num = Integer.valueOf(String.valueOf(c));

            int index = len - i - 1;
            sb.append(MoneyUnit.NUMBER_UPPER[num]).append(MoneyUnit.UINT[index]);
        }

        return sb.toString();
    }

    /**
     * 将“壹万贰仟叁佰肆拾伍元”按每个字转换成数组
     * @param s
     * @return
     */
    public static String[] toArray(String s)
    {
        return Assert.notEmpty(s) ? s.split("") : null;
    }

    private static char[] numberToArray(String number)
    {
        number = Assert.trimToEmpty(number).replace(" ", "");

        if(Assert.isNumber(number))
        {
            return number.toCharArray();
        }

        return null;
    }

    private static char[] numberToArray(int number)
    {
        return numberToArray(String.valueOf(number));
    }


    public static void main(String[] args) {
        System.out.println("-----------");

        for (String s : toUpperNumber("12345").split("")) {
            System.out.println(s);
        }

        System.out.println("-----------");
    }
}
