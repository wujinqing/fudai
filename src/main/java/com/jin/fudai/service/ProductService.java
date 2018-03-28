package com.jin.fudai.service;

import com.jin.fudai.entity.Product;

import java.util.List;

/**
 * @author wu.jinqing
 * @date 2018年03月28日
 */
public interface ProductService {
    Product save(Product product);

    List<Product> findAll();
}
