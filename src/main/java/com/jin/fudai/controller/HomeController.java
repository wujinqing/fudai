package com.jin.fudai.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

/**
 * @author wu.jinqing
 * @date 2018年03月26日
 */
@Controller
public class HomeController {
    /**
     * 首页
     *
     * @param model
     * @return
     */
    @RequestMapping("/")
    public String welcome(Model model) {
        return "index";
    }

    /**
     * 首页左侧菜单
     *
     * @param model
     * @return
     */
    @RequestMapping("/left_menu")
    public String menu(Model model) {
        return "menu";
    }
}
