package com.product.repository;

import com.product.model.Product;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

public class ProductRepository implements IProductRepository{
    private static final Map<Integer, Product> PRODUCTS = new HashMap<>();

    static {
        Product productA = new Product(1,"Nike",1000.00,"white");
        PRODUCTS.put(1,productA);
        Product productB = new Product(2,"Adidas",900.00,"black");
        PRODUCTS.put(2,productB);
    }
    @Override
    public List<Product> findAll() {
        return new ArrayList<>(PRODUCTS.values());
    }

    @Override
    public void save(Product product) {
        PRODUCTS.put(product.getId(), product);
    }

    @Override
    public void update(int id, Product product) {
        PRODUCTS.put(id, product);
    }

    @Override
    public void delete(int id) {
        PRODUCTS.remove(id);
    }

    @Override
    public Product findById(int id) {
        return PRODUCTS.get(id);
    }

    @Override
    public List<Product> findByName(String name) {
        List<Product> products = new ArrayList<>();
        for (Product product : PRODUCTS.values()) {
            if (product.getNameProduct().contains(name)) {
                products.add(product);
            }
        }
        return products;
    }
}
