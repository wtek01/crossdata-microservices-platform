package com.crossdata.platform.dashboard.client;

import org.springframework.cloud.openfeign.FeignClient;
import org.springframework.web.bind.annotation.GetMapping;
import com.crossdata.platform.dashboard.model.Order;

import java.util.List;

@FeignClient(name = "order-service")
public interface OrderServiceClient {
    @GetMapping("/api/orders")
    List<Order> getAllOrders();
}