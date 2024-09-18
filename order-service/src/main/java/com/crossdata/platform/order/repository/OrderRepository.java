package com.crossdata.platform.order.repository;

import com.crossdata.platform.order.model.Order;
import org.springframework.data.jpa.repository.JpaRepository;

public interface OrderRepository extends JpaRepository<Order, Long> {
}