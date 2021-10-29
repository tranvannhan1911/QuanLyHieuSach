use HieuSach;

insert into TaiKhoan (TaiKhoan, MatKhau) values('admin', 'admin');

GO

insert into KhachHang (HoTen, SoDienThoai, DiaChi, TaiKhoanID) values(N'Trần Văn Nhân', '0987654321', N'Thủ Đức', 1);

--select * from taikhoan;

insert into LoaiSanPham (TenLoai) values(N'Sách');
insert into LoaiSanPham (TenLoai) values(N'Bút');

insert into NhaCungCap (tenNCC, DiaChi, SoDienThoai) values(N'Kim đồng', N'Hà Nội', '0987654321');
insert into NhaCungCap (tenNCC, DiaChi, SoDienThoai) values(N'Thiên kim', N'Hà Nội', '0987654322');

insert into SanPham (MaNCC, MaLoai, TenSp, GiaSp) values(1, 1, N'Sách tiếng việt 1', 15000);
insert into SanPham (MaNCC, MaLoai, TenSp, GiaSp) values(1, 1, N'Sách tiếng việt 2', 16000);
insert into SanPham (MaNCC, MaLoai, TenSp, GiaSp) values(1, 1, N'Sách toán 1', 14500);
insert into SanPham (MaNCC, MaLoai, TenSp, GiaSp) values(1, 1, N'Sách toán 2', 17000);

insert into SanPham (MaNCC, MaLoai, TenSp, GiaSp) values(2, 2, N'Bút bi', 5000);
insert into SanPham (MaNCC, MaLoai, TenSp, GiaSp) values(2, 2, N'Bút chì', 6000);