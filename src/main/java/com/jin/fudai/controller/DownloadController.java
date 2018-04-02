package com.jin.fudai.controller;

import com.jin.fudai.dto.FileDto;
import com.jin.fudai.entity.SaleOrder;
import com.jin.fudai.util.Assert;
import org.springframework.data.domain.Sort;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import java.io.File;
import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author wu.jinqing
 * @date 2018年04月02日
 */
@Controller
@RequestMapping("download")
public class DownloadController {
    public static final String ROOT_PATH = "/doc/";
    private static final String docPath = DownloadController.class.getClassLoader().getResource("doc/").getPath();

    @RequestMapping("/center")
    public String center(Model model) {
        List<FileDto> fileList = new ArrayList<>();

        if(Assert.notEmpty(docPath))
        {
            File root = new File(docPath);

            File[] files = root.listFiles();

            if(Assert.notEmpty(files))
            {
                for (File file : files) {
                    String fileName = file.getName();
                    FileDto dto = new FileDto();

                    dto.setFileName(fileName);
                    dto.setFilePath(fileName);

                    fileList.add(dto);

                }
            }
        }

        model.addAttribute("fileList", fileList);

        return "download_center";
    }

    public static void main(String[] args) {



        String s = DownloadController.class.getClassLoader().getResource("doc/").getPath();
        System.out.println(s);
        File f = new File(s);

        for (File f1 : f.listFiles()) {
            System.out.println(f1.getName());
        }

        System.out.println(s);
    }
}
