use HieuSach;

insert into TaiKhoan (TaiKhoan, MatKhau) values('tranvannhan1911', 'nhan3008');

GO

insert into KhachHang (HoTen, SoDienThoai, DiaChi, TaiKhoanID) values('Trần Văn Nhân', '0987654321', 'Thủ Đức', 1);


use master;

drop database HieuSach;

select * from taikhoan;

alter table TaiKhoan
drop column KhachHangMaKh;

drop table TaiKhoan;