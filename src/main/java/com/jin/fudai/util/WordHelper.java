package com.jin.fudai.util;

import org.apache.poi.xwpf.usermodel.*;
import org.openxmlformats.schemas.wordprocessingml.x2006.main.CTTbl;
import org.openxmlformats.schemas.wordprocessingml.x2006.main.CTTblPr;
import org.openxmlformats.schemas.wordprocessingml.x2006.main.CTTblWidth;
import org.openxmlformats.schemas.wordprocessingml.x2006.main.STTblWidth;

import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.OutputStream;
import java.math.BigInteger;
import java.util.Random;

/**
 * @author wu.jinqing
 * @date 2018年03月20日
 */
public class WordHelper {




    public static void main2(String[] args) throws IOException {
        try (XWPFDocument doc = new XWPFDocument()) {
            XWPFTable table = doc.createTable(9, 1);

            CTTblWidth width = CTTblWidth.Factory.newInstance();


            table.getCTTbl().addNewTblPr().addNewTblW().setType(STTblWidth.NIL);
            // 第一行
            XWPFTableRow row1 = table.getRow(0);
            XWPFTableCell cell1 = row1.getCell(0);
//            cell1.getCTTc().

//            row1.createCell();
//            row1.createCell();

            try (OutputStream out = new FileOutputStream("C:\\Users\\wujq\\Desktop\\doc\\simpleTable"+ System.currentTimeMillis()+".docx")) {
                doc.write(out);
            }
        }
    }
}
