package com.jin.fudai.dao;

import com.jin.fudai.entity.Product;
import org.springframework.data.jpa.repository.JpaRepository;

/**
 * @author wu.jinqing
 * @date 2018年03月28日
 */
public interface ProductDao {
    Product save(Product entity);
}
