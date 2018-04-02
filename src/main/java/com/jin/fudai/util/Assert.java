package com.jin.fudai.util;

import java.util.Collection;
import java.util.regex.Pattern;

/**
 * @author wu.jinqing
 * @date 2018年03月29日
 */
public class Assert {
    private static final String NUMBER_REGEX = "^[0-9]+$";
    private static final Pattern NUMBER_PATTERN = Pattern.compile(NUMBER_REGEX);

     public static <T> boolean  notEmpty(Collection<T> clo)
    {
        return clo != null && clo.size() > 0;
    }

    public static <T> boolean  notEmpty(T[] clo)
    {
        return clo != null && clo.length > 0;
    }

    public static <T> boolean  empty(Collection<T> clo)
    {
        return clo == null || clo.size() == 0;
    }

    public static boolean  notEmpty(String clo)
    {
        return clo != null && clo.trim().length() > 0;
    }

    public static <T> boolean  notNull(T obj)
    {
        return obj != null;
    }

    public static <T> boolean isNull(T obj)
    {
        return obj == null;
    }

    public static String  trimLastComma(String s)
    {
        if(notEmpty(s))
        {
            if(",".equals(String.valueOf(s.charAt(s.length() -1))))
            {
                System.out.println(s);
                s = s.substring(0, s.length() -1);
            }
        }
        return s;
    }

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

    public static void main(String[] args) {
        System.out.println(trimLastComma("ab,"));
    }
}
