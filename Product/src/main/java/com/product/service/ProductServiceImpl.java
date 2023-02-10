package com.product.service;

import com.product.model.Product;
import com.product.repository.IProductRepository;
import com.product.repository.ProductRepository;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

public class ProductServiceImpl implements ProductService {
    private static final IProductRepository PRODUCT_REPOSITORY = new ProductRepository();

    @Override
    public List<Product> findAll() {
        return PRODUCT_REPOSITORY.findAll();
    }

    @Override
    public void save(Product product) {
        PRODUCT_REPOSITORY.save(product);
    }

    @Override
    public void update(int id, Product product) {
        PRODUCT_REPOSITORY.update(id, product);
    }

    @Override
    public void delete(int id) {
        PRODUCT_REPOSITORY.delete(id);
    }

    @Override
    public Product findById(int id) {
        return PRODUCT_REPOSITORY.findById(id);
    }

    @Override
    public List<Product> findByName(String name) {
        return PRODUCT_REPOSITORY.findByName(name);
    }
}
