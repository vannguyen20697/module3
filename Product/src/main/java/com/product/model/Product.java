package com.product.model;

public class Product {
    private int id;
    private String nameProduct;
    private double price;
    private String description;

    public Product() {
    }

    public Product(int id, String nameProduct, double price, String description) {
        this.id = id;
        this.nameProduct = nameProduct;
        this.price = price;
        this.description = description;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getNameProduct() {
        return nameProduct;
    }

    public void setNameProduct(String nameProduct) {
        this.nameProduct = nameProduct;
    }

    public double getPrice() {
        return price;
    }

    public void setPrice(double price) {
        this.price = price;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }
    @Override
    public String toString() {
        return "Product{" +
                "id=" + id +
                ", nameProduct='" + nameProduct + '\'' +
                ", price=" + price +
                ", description='" + description + '\'' +
                '}';
    }
}