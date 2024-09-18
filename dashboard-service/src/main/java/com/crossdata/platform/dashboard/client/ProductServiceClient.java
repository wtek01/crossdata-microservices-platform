package com.crossdata.platform.dashboard.client;

import org.springframework.cloud.openfeign.FeignClient;
import org.springframework.web.bind.annotation.GetMapping;
import com.crossdata.platform.dashboard.model.Product;

import java.util.List;

@FeignClient(name = "product-service")
public interface ProductServiceClient {
    @GetMapping("/api/products")
    List<Product> getAllProducts();
}