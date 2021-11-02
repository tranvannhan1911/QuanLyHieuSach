use HieuSach;

insert into TaiKhoan (TaiKhoan, MatKhau) values('admin', 'admin');

GO

insert into KhachHang (HoTen, SoDienThoai, DiaChi, TaiKhoanID) values(N'admin', '0987654321', N'Thủ Đức', 1);
insert into NhanVien (TenNv, SoDienThoai, DiaChi, caLamViec, chucNang, TaiKhoanID) values(N'admin', '0987654321', N'Thủ Đức', 1, 1, 1);



insert into LoaiSanPham (TenLoai) values(N'Sách');
insert into LoaiSanPham (TenLoai) values(N'Bút');
insert into LoaiSanPham (TenLoai) values(N'Sách giáo Khoa');


----
insert into NhaCungCap (tenNCC, DiaChi, SoDienThoai) values(N'Kim đồng', N'Hà Nội', '0987654321');
insert into NhaCungCap (tenNCC, DiaChi, SoDienThoai) values(N'Thiên kim', N'Hà Nội', '0987654322');
insert into NhaCungCap (tenNCC) values(N'Thiên Văn');


insert into SanPham (MaNCC, MaLoai, TenSp, GiaSp, GiaNhap, SoLuong) values(1, 1, N'Sách tiếng việt 1', 15000, 13000, 50);
insert into SanPham (MaNCC, MaLoai, TenSp, GiaSp, GiaNhap, SoLuong) values(1, 1, N'Sách tiếng việt 2', 16000, 13000, 30);
insert into SanPham (MaNCC, MaLoai, TenSp, GiaSp, GiaNhap, SoLuong) values(1, 1, N'Sách toán 1', 14500, 13000, 40);
insert into SanPham (MaNCC, MaLoai, TenSp, GiaSp, GiaNhap, SoLuong) values(1, 1, N'Sách toán 2', 17000, 13000, 50);
insert into SanPham (MaNCC, MaLoai, TenSp, GiaSp, GiaNhap, SoLuong) values(1, 3, N'Sách đạo đức', 17000, 13000, 50);

insert into SanPham (MaNCC, MaLoai, TenSp, GiaSp, GiaNhap, SoLuong) values(2, 2, N'Bút bi', 5000, 4500, 10);
insert into SanPham (MaNCC, MaLoai, TenSp, GiaSp, GiaNhap, SoLuong) values(2, 2, N'Bút chì', 6000, 4500, 40);
