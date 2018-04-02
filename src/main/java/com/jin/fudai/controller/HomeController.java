package com.jin.fudai.controller;

import com.jin.fudai.entity.SaleOrder;
import com.jin.fudai.repository.SaleOrderRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Sort;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import java.util.List;

/**
 * @author wu.jinqing
 * @date 2018年03月26日
 */
@Controller
public class HomeController {
    @Autowired
    private SaleOrderRepository saleOrderRepository;
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

    /**
     * 首页又侧菜单
     *
     * @param model
     * @return
     */
    @RequestMapping("/right_menu")
    public String right(Model model) {
        List<SaleOrder> orderList = saleOrderRepository.findAll(Sort.by(Sort.Direction.DESC, "id"));

        model.addAttribute("orderList", orderList);
        return "sales_order_first";
    }
}
