use khu_nghi_duong_Furama;
-- 2.	Hiển thị thông tin của tất cả nhân viên có trong hệ thống có tên bắt đầu 
-- là một trong các ký tự “H”, “T” hoặc “K” và có tối đa 15 kí tự.

select * 
from nhan_vien
where (ho_ten like 'H%' OR ho_ten like 'T%' OR ho_ten like 'K%') AND char_length(ho_ten) < 15;

-- 3.	Hiển thị thông tin của tất cả khách hàng có độ tuổi từ 18 đến 50 tuổi 
-- và có địa chỉ ở “Đà Nẵng” hoặc “Quảng Trị”.
select *
from khach_hang
where   (timestampdiff(year,ngay_sinh,now()) between 18 and 50) AND (dia_chi like '%Đà Nẵng%' or dia_chi like '%Quảng Trị%');

-- 4.	Đếm xem tương ứng với mỗi khách hàng đã từng đặt phòng bao nhiêu lần. 
-- Kết quả hiển thị được sắp xếp tăng dần theo số lần đặt phòng của khách hàng. 
-- Chỉ đếm những khách hàng nào có Tên loại khách hàng là “Diamond”.
select khach_hang.ma_khach_hang,ho_ten,ten_loai_khach ,count(ma_hop_dong) as so_lan_dat_phong  
from khach_hang 
join loai_khach
using(ma_loai_khach)
join hop_dong  
using (ma_khach_hang)
where ten_loai_khach = 'Diamond'
group by khach_hang.ma_khach_hang
order by so_lan_dat_phong;

-- 5.	Hiển thị ma_khach_hang, ho_ten, ten_loai_khach, ma_hop_dong, ten_dich_vu, ngay_lam_hop_dong, ngay_ket_thuc, tong_tien 
-- (Với tổng tiền được tính theo công thức như sau: Chi Phí Thuê + Số Lượng * Giá, với Số Lượng và Giá là từ bảng dich_vu_di_kem, hop_dong_chi_tiet) 
-- cho tất cả các khách hàng đã từng đặt phòng. (những khách hàng nào chưa từng đặt phòng cũng phải hiển thị ra).




 -- 7.	Hiển thị thông tin ma_dich_vu, ten_dich_vu, dien_tich, so_nguoi_toi_da, chi_phi_thue, ten_loai_dich_vu của 
 -- tất cả các loại dịch vụ đã từng được khách hàng đặt phòng trong năm 2020 nhưng chưa từng được khách hàng đặt phòng trong năm 2021.
-- select ma_dich_vu, ten_dich_vu, dien_tich, so_nguoi_toi_da,chi_phi_thue, ten_loai_dich_vu, ma_hop_dong, ngay_lam_hop_dong
-- from dich_vu dvv
-- join hop_dong
-- using (ma_dich_vu)
-- join loai_dich_vu
-- using (ma_loai_dich_vu)
-- where exists (
-- select 1 from dich_vu dv join hop_dong hd on dv.ma_dich_vu = hd.ma_dich_vu where year(hd.ngay_lam_hop_dong) = 2020 and dvv.ma_dich_vu = dv.ma_dich_vu
-- );
SELECT
    ma_dich_vu, ten_dich_vu, dien_tich, so_nguoi_toi_da, chi_phi_thue, ten_loai_dich_vu
from
    dich_vu dv
    JOIN loai_dich_vu 
    USING (ma_loai_dich_vu)
WHERE
    EXISTS (
        SELECT
            1
        FROM
            hop_dong
        WHERE
            dv.ma_dich_vu = ma_dich_vu
            and year(ngay_lam_hop_dong) = 2020
    )
    and 
	not EXISTS (
        SELECT
            1
        FROM
            hop_dong
        WHERE
            dv.ma_dich_vu = ma_dich_vu
            and year(ngay_lam_hop_dong) = 2021
    )
    ;


--  (year(ngay_lam_hop_dong) = 2020 and year(ngay_lam_hop_dong) <> 2021)
-- group by ten_dich_vu;
-- not in so sanh 1 cot
-- select * from hop_dong where ma_dich_vu in (1,3) and year(ngay_lam_hop_dong) = 2021

-- 6.	Hiển thị ma_dich_vu, ten_dich_vu, dien_tich, chi_phi_thue, ten_loai_dich_vu của 
-- tất cả các loại dịch vụ chưa từng được khách hàng thực hiện đặt từ quý 1 của năm 2021 (Quý 1 là tháng 1, 2, 3).

-- <> all / not in

select ma_dich_vu, ten_dich_vu, dien_tich, chi_phi_thue,ten_loai_dich_vu
from dich_vu
join loai_dich_vu 
using (ma_loai_dich_vu)
where 
	 ma_dich_vu <>all (
        SELECT
            ma_dich_vu
        from
            dich_vu
            join hop_dong using (ma_dich_vu)
        WHERE
            ngay_lam_hop_dong BETWEEN '2021-01-01'
            and '2021-03-31'
    );
    
-- 8.	Hiển thị thông tin ho_ten khách hàng có trong hệ thống, với yêu cầu ho_ten không trùng nhau.
-- Học viên sử dụng theo 3 cách khác nhau để thực hiện yêu cầu trên.
 select distinct(ho_ten)
 from khach_hang;

select ho_ten
from khach_hang
group by ho_ten;

select ho_ten
from khach_hang
union distinct
select ho_ten
from khach_hang;
 
 -- 9.	Thực hiện thống kê doanh thu theo tháng
 -- nghĩa là tương ứng với mỗi tháng trong năm 2021 thì sẽ có bao nhiêu khách hàng thực hiện đặt phòng.
select month(ngay_lam_hop_dong) as thang,count(ma_khach_hang) as so_luong_khach_hang
from hop_dong
join khach_hang
using (ma_khach_hang)
where year(ngay_lam_hop_dong) = 2021
group by thang
order by thang;

 -- 10.Hiển thị thông tin tương ứng với từng hợp đồng thì đã sử dụng bao nhiêu dịch vụ đi kèm. 
 -- Kết quả hiển thị bao gồm ma_hop_dong, ngay_lam_hop_dong, ngay_ket_thuc, tien_dat_coc, so_luong_dich_vu_di_kem (được tính dựa trên việc sum so_luong ở dich_vu_di_kem).
select hop_dong.ma_hop_dong, ngay_lam_hop_dong, ngay_ket_thuc, tien_dat_coc, if(so_luong is null,0,sum(so_luong)) as so_luong_dich_vu_di_kem
from hop_dong
left join hop_dong_chi_tiet
using(ma_hop_dong)
left join dich_vu_di_kem
using(ma_dich_vu_di_kem)
group by ma_hop_dong;

-- 11.	Hiển thị thông tin các dịch vụ đi kèm đã được sử dụng bởi những khách hàng có ten_loai_khach là “Diamond” và có dia_chi ở “Vinh” hoặc “Quảng Ngãi”.
select ma_dich_vu_di_kem,ten_dich_vu_di_kem
from loai_khach
join khach_hang
using(ma_loai_khach)
join hop_dong
using(ma_khach_hang)
join hop_dong_chi_tiet
using(ma_hop_dong)
join dich_vu_di_kem
using (ma_dich_vu_di_kem)
where ten_loai_khach = 'Diamond' and (dia_chi like '%Vinh%' or dia_chi like '%Quảng Ngãi%');

-- 12.	Hiển thị thông tin ma_hop_dong, ho_ten (nhân viên), ho_ten (khách hàng), so_dien_thoai (khách hàng), ten_dich_vu, so_luong_dich_vu_di_kem (được tính dựa trên việc sum so_luong ở dich_vu_di_kem)
-- tien_dat_coc của tất cả các dịch vụ đã từng được khách hàng đặt vào 3 tháng cuối năm 2020 nhưng chưa từng được khách hàng đặt vào 6 tháng đầu năm 2021.
select ma_hop_dong,
nhan_vien.ho_ten as ho_ten_nhan_vien, 
khach_hang.ho_ten as ho_ten_khach_hang, 
khach_hang.so_dien_thoai as sdt_khach_hang,
ma_dich_vu,
ten_dich_vu,
if(sum(so_luong) is null,0,sum(so_luong)) as so_luong_dich_vu_di_kem,
tien_dat_coc
from hop_dong
join nhan_vien
using(ma_nhan_vien)
join khach_hang
using (ma_khach_hang)
join dich_vu
using (ma_dich_vu)
left join hop_dong_chi_tiet
using (ma_hop_dong)
where
    EXISTS (
        SELECT
            tien_dat_coc
        FROM
            hop_dong
        WHERE
            dich_vu.ma_dich_vu = ma_dich_vu
            and year(ngay_lam_hop_dong) = 2020
            and month(ngay_lam_hop_dong) in (10,11,12)
    ) and
    not EXISTS (
        SELECT
            tien_dat_coc
        FROM
            hop_dong
        WHERE
           dich_vu.ma_dich_vu = ma_dich_vu
            and year(ngay_lam_hop_dong) = 2021
            and month(ngay_lam_hop_dong) in (1,2,3,4,5,6)
    )
    group by ma_hop_dong;
-- 13.	Hiển thị thông tin các Dịch vụ đi kèm được sử dụng nhiều nhất bởi các Khách hàng đã đặt phòng. 
-- (Lưu ý là có thể có nhiều dịch vụ có số lần sử dụng nhiều như nhau).
	select ma_dich_vu_di_kem,ten_dich_vu_di_kem, count(so_luong) as so_luong_dich_vu_di_kem
    from dich_vu_di_kem
    join hop_dong_chi_tiet
    using(ma_dich_vu_di_kem)
    join hop_dong
    using (ma_hop_dong)
    where 
    
    





