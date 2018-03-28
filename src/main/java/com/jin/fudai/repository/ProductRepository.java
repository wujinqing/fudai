package com.jin.fudai.repository;

import com.jin.fudai.entity.Product;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.repository.CrudRepository;

/**
 * @author wu.jinqing
 * @date 2018年03月28日
 */
public interface ProductRepository extends JpaRepository<Product, Long> {

}
