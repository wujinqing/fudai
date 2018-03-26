package com.jin.fudai.controller;

import com.jin.fudai.entity.Product;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import java.util.Date;
import java.util.Map;

/**
 * @author wu.jinqing
 * @date 2018年03月26日
 */
@Controller
@RequestMapping("/product")
public class ProductController {
    @RequestMapping("/list")
    public String list(Model model) {
        Product p = new Product();

        p.setId(1L);
        p.setName("尊贵系列门卫浴");
        p.setStyle("YH-8241");
        p.setColor("香槟金");
        p.setUnit("樘");
        p.setPrice("910");

        model.addAttribute("product", p);

        return "product_list";
    }

    @RequestMapping("/add")
    public String welcome(Model model) {
        Product p = new Product();

        p.setId(1L);
        p.setName("尊贵系列门卫浴");
        p.setStyle("YH-8241");
        p.setColor("香槟金");
        p.setUnit("樘");
        p.setPrice("910");

        model.addAttribute("product", p);

        return "product_input";
    }


}
