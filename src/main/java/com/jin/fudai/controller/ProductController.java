package com.jin.fudai.controller;

import com.alibaba.fastjson.JSON;
import com.jin.fudai.entity.Product;
import org.springframework.lang.Nullable;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.Map;

/**
 * @author wu.jinqing
 * @date 2018年03月26日
 */
@Controller
@RequestMapping("/product")
public class ProductController {
    @RequestMapping("/list")
    public String list(Model model,
                       @RequestParam @Nullable String name) {
        System.out.println("查询订单列表");
        System.out.println("查询订单列表, name: " + name);

        List<Product> productList = new ArrayList<>();

        Product p = new Product();

        p.setId(1L);
        p.setName("尊贵系列门卫浴");
        p.setStyle("YH-8241");
        p.setColor("香槟金");
        p.setUnit("樘");
        p.setPrice("910");

        productList.add(p);

        model.addAttribute("productList", productList);

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
