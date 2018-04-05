package com.jin.fudai.repository;

import com.jin.fudai.entity.Product;
import com.jin.fudai.entity.SaleOrder;
import org.springframework.data.domain.Sort;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

/**
 * @author wu.jinqing
 * @date 2018年03月30日
 */
public interface SaleOrderRepository extends JpaRepository<SaleOrder, Long> {
    SaleOrder findTopByOrderByIdDesc();
}
