package com.jin.fudai;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.EnableAutoConfiguration;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.config.annotation.EnableWebMvc;

/**
 * 服务启动器类
 *
 * @author wu.jinqing
 * @date 2018年03月24日
 */
@SpringBootApplication
public class ServerBootstrap {
    public static void main(String[] args) {
        SpringApplication.run(ServerBootstrap.class, args);
    }
}
