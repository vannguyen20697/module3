<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<html>
<head>
    <title>Product</title>
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css"
          integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
</head>
<body>
<h1>Product</h1>
<p>
    <a href="/products?action=create">Create new Product</a>
</p>
<form action="/products" method="post" class="form-inline">
    <input type="hidden" name="action" value="search">
    <div class="form-group mr-3">
        <input type="text"
               class="form-control" name="nameSearch" placeholder="Name">
    </div>
    <button type="submit" class="btn btn-primary">Search</button>
</form>
<table class="table">
    <thead>
    <tr>
        <td>Id</td>
        <td>Name</td>
        <td>Price</td>
        <td>Description</td>
        <td>Edit</td>
        <td>Delete</td>
        <td>View</td>
    </tr>
    <thead>
    <tbody>
    <c:forEach items='${pro}' var="product">
    <tr>
        <td><a href="/products?action=view&id=${product.getId()}">${product.getId()}</a></td>
        <td>${product.getNameProduct()}</td>
        <td>${product.getPrice()}</td>
        <td>${product.getDescription()}</td>
        <td><a href="/products?action=update&id=${product.getId()}">Update</a></td>
        <td><a href="/products?action=delete&id=${product.getId()}">Delete</a></td>
        <td><a href="/products?action=view&id=${product.getId()}">View</a></td>
    </tr>
    </c:forEach>
    <tbody>
</table>
</body>
</html>
