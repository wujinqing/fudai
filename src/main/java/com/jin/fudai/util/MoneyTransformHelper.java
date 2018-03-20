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
    private static final String NUMBER_REGEX = "^[0-9]+$";
    private static final Pattern NUMBER_PATTERN = Pattern.compile(NUMBER_REGEX);
    
    /**
     * <pre>
     *  验证是否为数字
     * <pre>
     *
     * @param arg
     * @return
     */
    public static boolean isNumber(String arg)
    {
        return NUMBER_PATTERN.matcher(trimToEmpty(arg)).matches();
    }

    /**
     * <pre>
     * 去除字符串arg两端的空格
     * <pre>
     *
     * @param arg
     * @return  arg != null ? arg.trim() : ""
     */
    public static String trimToEmpty(String arg)
    {
        return arg != null ? arg.trim() : "";
    }

    public static char[] numberToArray(String number)
    {
        number = trimToEmpty(number).replace(" ", "");

        if(isNumber(number))
        {
            return number.toCharArray();
        }

        return null;
    }

    public static char[] numberToArray(int number)
    {
        return numberToArray(String.valueOf(number));
    }

    public static String toUpperNumber(int number)
    {
        return toUpperNumber(String.valueOf(number));
    }
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
}
