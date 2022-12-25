create database demo;
use demo;

create table Products(
id int,
product_code int,
product_name varchar(255),
product_price int,
product_amount int,
product_description varchar(500),
product_status varchar(255)
);
-- Chèn một số dữ liệu mẫu cho bảng Products
insert into Products
value (1,1357,'Adidas',10000,6,'cute','stock'),
      (2,2468,'Nike',20000,4,'sexy','sold'),
      (3,1234,'Converse',15000,7,'beautiful','stock'),
      (4,3578,'Valentino',45000,3,'nice','stock');
      
-- Tạo Unique Index trên bảng Products (sử dụng cột productCode để tạo chỉ mục)
ALTER TABLE products 
ADD unique INDEX idx_productCode(product_code);

-- Tạo Composite Index trên bảng Products (sử dụng 2 cột productName và productPrice)
ALTER TABLE products 
ADD INDEX idx_full_name_price(product_name, product_price);

-- Sử dụng câu lệnh EXPLAIN để biết được câu lệnh SQL của bạn thực thi như nào
EXPLAIN SELECT * FROM products WHERE product_code = "2468";
EXPLAIN SELECT * FROM products WHERE product_code = "1234" or product_price = "Converse" ;

-- Tạo view lấy về các thông tin: productCode, productName, productPrice, productStatus từ bảng products
create view veiw_products as
select product_code,product_name,product_price,product_status
from products;
-- Tiến hành sửa đổi view
update veiw_products
set product_price = "12000"
where product_code = "1234";

-- Tiến hành xoá view
DELETE FROM veiw_products 
WHERE product_code = "1234";

DROP VIEW veiw_products;

-- Tạo store procedure lấy tất cả thông tin của tất cả các sản phẩm trong bảng product

DELIMITER $$
CREATE PROCEDURE findAllProducts()
BEGIN
  SELECT * FROM products ;
END $$
DELIMITER ;
 CALL findAllProducts();
 
-- Tạo store procedure thêm một sản phẩm mới
DELIMITER $$
CREATE PROCEDURE addNewProducts(
in id int,
in product_code int,
in product_name varchar(255),
in product_price int,
in product_amount int,
in product_description varchar(500),
in product_status varchar(255)
)
BEGIN
  insert into products
  value (id,product_code,product_name,product_price,product_amount,product_description,product_status);
END; $$
DELIMITER ;
call addNewProducts(5,2356,'Vans',14000,5,'good','sold')

-- Tạo store procedure xoá sản phẩm theo id
DELIMITER $$
CREATE PROCEDURE deleProducts(in text_id int)
BEGIN
  DELETE  FROM products
  WHERE id = text_id ;
END; $$
DELIMITER ;

CALL deleProducts(1);

-- Tạo store procedure sửa thông tin sản phẩm theo id
DELIMITER $$
CREATE PROCEDURE editProducts(
in Id int,
in productCode int,
in productName varchar(255),
in productPrice int,
in productAmount int,
in productDes varchar(500),
in productSta varchar(255)
)
BEGIN
update products
set  
product_code = productCode,
product_name = productName,
product_price = productPrice,
product_amount = productAmount,
product_description = productDes,
product_status = productSta
where id = Id;
END; $$
DELIMITER ;

call editProducts(4,9988,'Balenciaga',60000,'rich','stock');      
      
      

