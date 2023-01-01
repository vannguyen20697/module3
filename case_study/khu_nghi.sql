create database khu_nghi_duong_Furama;
use khu_nghi_duong_Furama;
create table vi_tri(
ma_vi_tri int primary key not null,
ten_vi_tri varchar(45)
);

create table vi_tri(
ma_vi_tri int primary key not null,
ten_vi_tri varchar(45)
);

create table bo_phan(
ma_bo_phan int primary key not null,
ten_bo_phan varchar(45)
);

create table nhan_vien(
ma_nhan_vien int primary key not null,
ho_ten varchar(45) not null,
ngay_sinh date not null,
so_cmnd varchar(45) not null,
luong double not null,
so_dien_thoai varchar(45) not null,
email varchar(45),
dia_chi varchar(45),
ma_vi_tri int not null,
ma_trinh_do int not null,
ma_bo_phan int not null,
foreign key (ma_vi_tri) references vi_tri(ma_vi_tri),
foreign key (ma_trinh_do) references trinh_do(ma_trinh_do),
foreign key (ma_bo_phan) references bo_phan(ma_bo_phan)
);

create table loai_khach(
ma_loai_khach int primary key not null,
ten_loai_khach varchar(45)
);

create table khach_hang(
ma_khach_hang int primary key not null,
ma_loai_khach int,
ho_ten varchar(45) not null,
ngay_sinh date not null,
gioi_tinh bit not null,
so_cmnd varchar(45) not null,
so_dien_thoai varchar(45) not null,
email varchar(45),
dia_chi varchar(45),
foreign key (ma_loai_khach) references loai_khach(ma_loai_khach)
);

create table kieu_thue(
ma_kieu_thue int primary key not null,
ten_kieu_thue varchar(45)
);

create table loai_dich_vu(
ma_loai_dich_vu int primary key not null,
ten_loai_dich_vu varchar(45)
);

create table dich_vu(
ma_dich_vu int primary key not null,
ten_dich_vu varchar(45) not null,
dien_tich int,
chi_phi_thue double not null,
so_nguoi_toi_da int,
ma_kieu_thue int,
ma_loai_dich_vu int,
tieu_chuan_phong varchar(45),
mo_ta_tien_nghi_khac varchar(45),
dien_tich_ho_bo double,
so_tang int,
foreign key (ma_kieu_thue) references kieu_thue(ma_kieu_thue),
foreign key (ma_loai_dich_vu) references loai_dich_vu(ma_loai_dich_vu)
);

create table dich_vu_di_kem(
ma_dich_vu_di_kem int primary key not null,
ten_dich_vu_di_kem varchar(45) not null,
gia double not null,
don_vi varchar(10),
trang_thai varchar(45)
);


create table hop_dong_chi_tiet(
ma_hop_dong_chi_tiet int primary key not null,
ma_hop_dong int,
ma_dich_vu_di_kem int,
so_luong int not null,
foreign key (ma_dich_vu_di_kem) references dich_vu_di_kem(ma_dich_vu_di_kem),
foreign key (ma_hop_dong) references hop_dong(ma_hop_dong)
);


create table hop_dong(
ma_hop_dong int primary key not null,
ngay_lam_hop_dong datetime not null,
ngay_ket_thuc datetime not null,
tien_dat_coc double not null,
ma_nhan_vien int,
ma_khach_hang int,
ma_dich_vu int,
foreign key (ma_nhan_vien) references nhan_vien(ma_nhan_vien),
foreign key (ma_khach_hang) references khach_hang(ma_khach_hang),
foreign key (ma_dich_vu) references dich_vu(ma_dich_vu)
);





