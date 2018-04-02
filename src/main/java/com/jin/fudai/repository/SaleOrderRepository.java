package com.jin.fudai.repository;

import com.jin.fudai.entity.Product;
import com.jin.fudai.entity.SaleOrder;
import org.springframework.data.jpa.repository.JpaRepository;

/**
 * @author wu.jinqing
 * @date 2018年03月30日
 */
public interface SaleOrderRepository extends JpaRepository<SaleOrder, Long> {
}
