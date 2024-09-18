package com.crossdata.platform.dashboard.service;

import com.crossdata.platform.dashboard.client.ProductServiceClient;
import com.crossdata.platform.dashboard.client.OrderServiceClient;
import com.crossdata.platform.dashboard.model.DashboardData;
import com.crossdata.platform.dashboard.model.Product;
import com.crossdata.platform.dashboard.model.Order;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Map;
import java.util.stream.Collectors;

@Service
public class DashboardService {

    @Autowired
    private ProductServiceClient productServiceClient;

    @Autowired
    private OrderServiceClient orderServiceClient;

    public DashboardData getDashboardData() {
        List<Product> products = productServiceClient.getAllProducts();
        List<Order> orders = orderServiceClient.getAllOrders();

        Map<Long, Product> productMap = products.stream()
                .collect(Collectors.toMap(Product::getId, p -> p));

        double totalRevenue = orders.stream()
                .mapToDouble(order -> {
                    Product product = productMap.get(order.getProductId());
                    return product != null ? product.getPrice() * order.getQuantity() : 0;
                })
                .sum();

        DashboardData dashboardData = new DashboardData();
        dashboardData.setTotalProducts(products.size());
        dashboardData.setTotalOrders(orders.size());
        dashboardData.setTotalRevenue(totalRevenue);

        return dashboardData;
    }
}