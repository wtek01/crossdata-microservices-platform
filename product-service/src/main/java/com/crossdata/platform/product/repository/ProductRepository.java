package com.crossdata.platform.product.repository;

import com.crossdata.platform.product.model.Product;
import org.springframework.data.jpa.repository.JpaRepository;

public interface ProductRepository extends JpaRepository<Product, Long> {
}