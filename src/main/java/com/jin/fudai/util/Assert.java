package com.jin.fudai.util;

import java.util.Collection;

/**
 * @author wu.jinqing
 * @date 2018年03月29日
 */
public class Assert {
     public static <T> boolean  notEmpty(Collection<T> clo)
    {
        return clo != null && clo.size() > 0;
    }

    public static boolean  notEmpty(String clo)
    {
        return clo != null && clo.trim().length() > 0;
    }

    public static <T> boolean  notNull(T obj)
    {
        return obj != null;
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

    public static void main(String[] args) {
        System.out.println(trimLastComma("ab,"));
    }
}
