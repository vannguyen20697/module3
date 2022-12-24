create database QuanLySinhVien;
use QuanLySinhVien;
create table class(
ClassID int not null auto_increment primary key,
ClassName varchar(60) not null,
StartDate datetime not null,
`Status` bit 
--  Kiểu dữ liệu BIT trong SQL Server là kiểu dữ liệu số nguyên có thể nhận giá trị 0, 1 hoặc NULL--
);

create table Student(
StudentId int not null auto_increment primary key,
StudentName varchar(30) not null,
Address varchar(50),
Phone varchar(20),
`Status` bit,
ClassId int not null,
foreign key (ClassID) references Class(ClassID)
);    
    
create table `Subject`(
    SubId int not null auto_increment primary key,
    SubName varchar(30) not null,
    Credit tinyint  null default 1 check (credit >=1),
    Status  bit default 1
);

create table Mark(
    MarkId int not null auto_increment primary key,
    SubId  int not null,
    StudentId int not null,
    Mark float default 0 check ( Mark between 0 and 100),
    ExamTimes tinyint default 1,
    UNIQUE (SubId, StudentId),
    FOREIGN KEY (SubId) REFERENCES Subject (SubId),
    FOREIGN KEY (StudentId) REFERENCES Student (StudentId)
);    

insert into class
values (1, 'A1', '2008-12-20', 1);
insert into Class
values (2, 'A2', '2008-12-22', 1);
insert into Class
values (3, 'B3', current_date, 0);

insert into Student (StudentName, Address, Phone, Status, ClassId)
values ('Hung', 'Ha Noi', '0912113113', 1, 1);
insert into Student (StudentName, Address, Status, ClassId)
values ('Hoa', 'Hai phong', 1, 1);
insert into Student (StudentName, Address, Phone, Status, ClassId)
values ('Manh', 'HCM', '0123123123', 0, 2);

insert into Subject
values (1, 'CF', 5, 1),
       (2, 'C', 6, 1),
       (3, 'HDJ', 5, 1),
       (4, 'RDBMS', 10, 1);
       
insert into Mark (SubId, StudentId, Mark, ExamTimes)
values (1, 1, 8, 1),
       (1, 2, 10, 2),
       (2, 1, 12, 1);

