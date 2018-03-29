package com.jin.fudai.controller;

import com.alibaba.fastjson.JSON;
import com.jin.fudai.entity.Product;
import com.jin.fudai.repository.ProductRepository;
import com.jin.fudai.service.ProductService;
import com.jin.fudai.util.ProductUtil;
import org.springframework.beans.factory.annotation.Autowired;
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
    @Autowired
    private ProductRepository productRepository;

    @RequestMapping("/list")
    public String list(Model model, Product product) {

        ProductUtil.trimLastComma(product);

        List<Product> productList = productRepository.findAll();

        productList = ProductUtil.filterProducts(productList, product);

        ProductUtil.ProductSumary productSumary = ProductUtil.productSumary(productList);
        System.out.println("productSumary:" + JSON.toJSONString(productSumary));
        model.addAttribute("productList", productList);
        model.addAttribute("productSumary", productSumary);

        return "product_list";
    }

    @RequestMapping("/add")
    public String add(Model model, Product product) {
        return "product_input";
    }

    @RequestMapping("/save")
    public String save(Model model, Product product) {
        System.out.println("json:" + JSON.toJSONString(product));
        productRepository.save(product);

        List<Product> productList = productRepository.findAll();

        model.addAttribute("productList", productList);
        return "product_list";
    }

    @RequestMapping("/del")
    public String del(Model model, long id) {
        productRepository.deleteById(id);

        List<Product> productList = productRepository.findAll();

        model.addAttribute("productList", productList);
        return "product_list";
    }

    @RequestMapping("/edit")
    public String edit(Model model, long id) {
        Product product = productRepository.findById(id).get();
        model.addAttribute("product", product);
        return "product_input";
    }
}
