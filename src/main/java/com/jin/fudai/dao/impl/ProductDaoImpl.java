package com.jin.fudai.dao.impl;

import com.jin.fudai.dao.ProductDao;
import com.jin.fudai.entity.Product;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.jpa.repository.support.SimpleJpaRepository;
import org.springframework.stereotype.Component;

/**
 * @author wu.jinqing
 * @date 2018年03月28日
 */
@Component
public class ProductDaoImpl implements ProductDao {
    @Override
    public Product save(Product entity) {
        return null;
    }
}
