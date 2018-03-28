package com.jin.fudai.service.impl;

import com.jin.fudai.entity.Product;
import com.jin.fudai.repository.ProductRepository;
import com.jin.fudai.service.ProductService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import java.util.List;

/**
 * @author wu.jinqing
 * @date 2018年03月28日
 */
@Component
public class ProductServiceImpl implements ProductService {
    @Autowired
    private ProductRepository productRepository;

    @Override
    public Product save(Product product) {
        return productRepository.save(product);
    }

    @Override
    public List<Product> findAll() {
        return productRepository.findAll();
    }
}
