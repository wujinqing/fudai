package com.jin.fudai.controller;

import com.jin.fudai.entity.Product;
import com.jin.fudai.entity.SaleOrder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import java.util.ArrayList;
import java.util.List;

/**
 * 生成订单
 *
 * @author wu.jinqing
 * @date 2018年03月27日
 */
@Controller
@RequestMapping("order")
public class SaleOrderController {
    @RequestMapping("/first")
    public String firstStep(Model model) {

        return "sales_order_first";
    }

    @RequestMapping("/second")
    public String secondStep(Model model) {
        SaleOrder order = new SaleOrder();

        order.setOrderNo("2018032701");
        order.setCustomerName("吴晋清");
        order.setCustomerPhoneNumber("15021083134");
        order.setCustomerAddress("上海市");
        order.setDate("2018年03月27日");
        order.setDeposit("10000");

        model.addAttribute("order", order);

        return "sales_order_second";
    }

    @RequestMapping("/third")
    public String thirdStep(Model model) {
        SaleOrder order = new SaleOrder();

        order.setOrderNo("2018032701");
        order.setCustomerName("吴晋清");
        order.setCustomerPhoneNumber("15021083134");
        order.setCustomerAddress("上海市");
        order.setDate("2018年03月27日");
        order.setDeposit("10000");

        List<Product> productList = new ArrayList<>();



        for (int i = 0; i <= 10; i++) {
            Product p = new Product();

            p.setId(1L);
            p.setName("尊贵系列门卫浴");
            p.setStyle("YH-8241");
            p.setColor("香槟金");
            p.setUnit("樘");
            p.setPrice(String.valueOf(910 + i));
            productList.add(p);
        }

        model.addAttribute("productList", productList);
        model.addAttribute("order", order);

        return "sales_order_third";
    }

    @RequestMapping("/add_product")
    public String addProduct(Model model) {
        return "sales_order_third";
    }

}
