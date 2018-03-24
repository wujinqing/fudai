package com.jin.fudai;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.EnableAutoConfiguration;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;

/**
 * 服务启动器类
 *
 * @author wu.jinqing
 * @date 2018年03月24日
 */
@RestController
@EnableAutoConfiguration
public class ServerBootstrap {
    @RequestMapping("/")
    @ResponseBody
    String home(Model model)
    {
        model.addAttribute("name", "zhangsan");
        return "index";
    }

    @RequestMapping("/freemarker")
    String fm(ModelAndView model)
    {
//        model.addAttribute("name", "zhangsan");
        return "fm";
    }

    public static void main(String[] args) {
        SpringApplication.run(ServerBootstrap.class, args);
    }
}
