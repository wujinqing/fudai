package com.jin.fudai.controller;

import com.jin.fudai.dto.OrderDto;
import com.jin.fudai.dto.ProductDto;
import com.jin.fudai.dto.SaleOrderDto;
import com.jin.fudai.entity.Product;
import com.jin.fudai.entity.SaleOrder;
import com.jin.fudai.entity.SaleOrderDetail;
import com.jin.fudai.repository.ProductRepository;
import com.jin.fudai.repository.SaleOrderRepository;
import com.jin.fudai.util.Assert;
import com.jin.fudai.util.FreeMarkerHelper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Sort;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.servlet.http.HttpServletResponse;
import java.io.*;
import java.util.ArrayList;
import java.util.List;
import java.util.concurrent.atomic.AtomicLong;

/**
 * 生成订单
 *
 * @author wu.jinqing
 * @date 2018年03月27日
 */
@Controller
@RequestMapping("order")
public class SaleOrderController {
    @Autowired
    private SaleOrderRepository saleOrderRepository;
    @Autowired
    private ProductRepository productRepository;

    @RequestMapping("/first")
    public String firstStep(Model model) {
        List<SaleOrder> orderList = saleOrderRepository.findAll(Sort.by(Sort.Direction.DESC, "id"));

        model.addAttribute("orderList", orderList);

        return "sales_order_first";
    }

    @RequestMapping("/second")
    public String secondStep(Model model, Long id) {
        SaleOrder order = null;
        if(Assert.notNull(id))
        {
            order = saleOrderRepository.findById(id).get();
        }else {
            order = new SaleOrder();

            order.setOrderNo("2018032701");
            order.setCustomerName("吴晋清");
            order.setCustomerPhoneNumber("15021083134");
            order.setCustomerAddress("上海市");
            order.setDate("2018年03月27日");
        }
        model.addAttribute("order", order);

        return "sales_order_second";
    }

    @RequestMapping("/third")
    public String thirdStep(Model model, SaleOrder order) {
        long orderId = order.getId();
        if(Assert.isNull(orderId) || 0 == orderId){
            saleOrderRepository.saveAndFlush(order);
        }else {
            order = saleOrderRepository.findById(orderId).get();
        }

        List<Product> productList = productRepository.findAll(Sort.by("name"));

        model.addAttribute("productList", productList);
        model.addAttribute("order", order);
        return "sales_order_third";
    }

    @RequestMapping("/add_product")
    public String addProduct(Model model, ProductDto product) {
        System.out.println("add");
        SaleOrder order = saleOrderRepository.findById(product.getOrderId()).get();
        Product p = productRepository.findById(product.getProductId()).get();
        List<SaleOrderDetail> details = order.getDetails();

        if(Assert.empty(details))
        {
            details = new ArrayList<>();
            order.setDetails(details);
        }

        SaleOrderDetail detail = new SaleOrderDetail();
        detail.setOrder(order);

        detail.setOrderNo(order.getOrderNo());
        detail.setName(p.getName());
        detail.setStyle(p.getStyle());
        detail.setColor(p.getColor());
        detail.setUnit(p.getUnit());
        detail.setPrice(p.getPrice());
        detail.setAmount(product.getAmount());
        detail.setOriginalPrice(product.getOriginalPrice());
        detail.setActualPrice(product.getActualPrice());

        details.add(detail);
        calPrice(order);
        saleOrderRepository.saveAndFlush(order);

        List<Product> productList = productRepository.findAll(Sort.by("name"));

        model.addAttribute("productList", productList);
        model.addAttribute("order", order);
        return "sales_order_third";
    }

    @RequestMapping("/del")
    public String del(Model model, long orderId) {
        saleOrderRepository.deleteById(orderId);

        List<SaleOrder> orderList = saleOrderRepository.findAll();

        model.addAttribute("orderList", orderList);

        return "sales_order_first";
    }

    @RequestMapping("/edit")
    public String edit(Model model, long orderId) {

        SaleOrder order = saleOrderRepository.findById(orderId).get();

        model.addAttribute("order", order);

        return "sales_order_detail";
    }

    @RequestMapping("/forth")
    public String forthStep(Model model, long orderId) {

        SaleOrder order = saleOrderRepository.findById(orderId).get();

        model.addAttribute("order", order);

        return "sales_order_forth";
    }

    @RequestMapping("/fifth")
    public String fifthStep(Model model, OrderDto orderDto) {

        SaleOrder order = saleOrderRepository.findById(orderDto.getOrderId()).get();

        order.setDeposit(orderDto.getDeposit());
        order.setLoansPrice(orderDto.getLoansPrice());
        saleOrderRepository.saveAndFlush(order);
        List<SaleOrder> orderList = saleOrderRepository.findAll(Sort.by(Sort.Direction.DESC, "id"));

        model.addAttribute("orderList", orderList);
        model.addAttribute("order", order);

        return "sales_order_first";
    }

    @RequestMapping("/download")
    public void download(HttpServletResponse res, long orderId) {
        List<String> list = new ArrayList<>();

        list.forEach(System.out::println);

        saleOrderRepository.findById(orderId).ifPresent(order -> {
            SaleOrderDto dto = new SaleOrderDto(order);
            String fileName = order.getOrderNo() + ".docx";
            // 第一步：生成word文档
            FreeMarkerHelper.process(fileName, dto);

            // 第二步：下载
            res.setContentType("application/x-msdownload");
            res.setHeader("Content-Disposition", "attachment;filename=\"" + fileName + "\"");
            try (
                    OutputStream os = res.getOutputStream();
                    InputStream is = this.getClass().getClassLoader().getResourceAsStream("doc/" + fileName);
            )
            {
                byte[] buf = new byte[1024];
                int len = 0;

                while (-1 != (len = is.read(buf)))
                {
                    os.write(buf, 0, len);
                }

                os.flush();

            } catch (IOException e) {
                e.printStackTrace();
            }
        });
    }

    private void calPrice(SaleOrder order)
    {
        if (Assert.notNull(order))
        {
            if (Assert.notEmpty(order.getDetails()))
            {
                AtomicLong originalPrice = new AtomicLong(0);
                AtomicLong actualPrice = new AtomicLong(0);

                order.getDetails().parallelStream().forEach(o -> {
                    originalPrice.addAndGet(o.getOriginalPrice());
                    actualPrice.addAndGet(o.getActualPrice());

                });

                order.setOriginalPrice(originalPrice.get());
                order.setActualPrice(actualPrice.get());
            }
        }
    }

}
