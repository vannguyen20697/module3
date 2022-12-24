use quan_ly_ban_hang;
insert into customer(c_ID,c_Name,c_Age)
values (1, 'Minh Quan', 10),
       (2, 'Ngoc Oanh', 20),
       (3, 'Hong Ha', 50);

insert into orders(o_ID,c_ID,o_Date,o_TotalPrice)
values (1,1,'2006-3-21', 10000),
       (2,2,'2006-3-23', 30000),
       (3,1,'2006-3-16', 40000);
       
insert into product(p_ID,p_Name,p_Price)
values (1,'May Giat',3),
	   (2,'Tu Lanh',5),
       (3,'Dieu Hoa',7),
       (4,'Quat',2),
       (5,'Bep Dien',1);

insert into order_detail(o_ID,p_ID,od_QTY)
values (1,1,3),
	   (1,3,7),
       (1,4,2),
       (2,1,1),
       (3,1,8),
       (2,5,4),
       (2,3,3);
 -- Hiển thị các thông tin  gồm oID, oDate, oPrice của tất cả các hóa đơn trong bảng Order
 select o_ID, o_Date,o_TotalPrice
 from orders;
 
 -- Hiển thị danh sách các khách hàng đã mua hàng, và danh sách sản phẩm được mua bởi các khách
 
select distinct  c_Name, p_Name
from customer 
join orders
using (c_ID) 
join order_detail
using (o_ID) 
join product
using (p_ID);


-- Hiển thị tên những khách hàng không mua bất kỳ một sản phẩm nào
select c_ID, c_NAME
from customer 
LEFT join orders
using (c_ID) 
WHERE o_ID IS NULL;

-- Hiển thị mã hóa đơn, ngày bán và giá tiền của từng hóa đơn
-- Giá bán của từng loại được tính = odQTY*pPrice
select o_ID, o_Date,p_Price, od_QTY, sum(p_Price*od_QTY) as total
from orders
join order_detail
using (o_ID)
join product
using (p_Id)