CREATE DATABASE he_thong_quan_ly_phong_tro;
USE he_thong_quan_ly_phong_tro;
create table hinh_thuc_thanh_toan (
id int primary key auto_increment,	
`name` varchar(50)
);

create table thong_tin_phong_tro (
id int primary key auto_increment,
`name` varchar(255),
phone_number varchar(50),
date_begin varchar(25),
note text,
id_thanh_toan int,
foreign key (id_thanh_toan) references hinh_thuc_thanh_toan(id)  ON DELETE CASCADE 
);


insert into hinh_thuc_thanh_toan values (1, 'Theo Tháng'), (2, 'Theo Quý'),  (3, 'Theo Năm');

insert into thong_tin_phong_tro values (1,'Lê Khánh', '0931104763', '2022-01-12', 'Có Điều Hòa','1'),
									   (2,'Phạm Thành', '0914563123', '2020-12-12', 'Có Giường','2'),
									   (3,'Nguyễn Vinh', '0765234123', '2019-01-09', 'Có Tủ','3');