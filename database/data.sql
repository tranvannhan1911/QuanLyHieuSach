use HieuSach;

insert into TaiKhoan (TaiKhoan, MatKhau) values('tranvannhan1911', 'nhan3008');

GO

insert into KhachHang (HoTen, SoDienThoai, DiaChi, TaiKhoanID) values('Trần Văn Nhân', '0987654321', 'Thủ Đức', 1);

--select * from taikhoan;

insert into LoaiSanPham (TenLoai) values('Truyện');

insert into NhaCungCap (tenNCC, DiaChi, SoDienThoai) values('Kim đồng', 'Hà Nội', '0987654321');

insert into SanPham (MaNCC, MaLoai, TenSp, GiaSp) values(1, 1, 'Truyện conan', 15000);
insert into SanPham (MaNCC, MaLoai, TenSp, GiaSp) values(1, 1, 'Truyện doraemon', 16000);
insert into SanPham (MaNCC, MaLoai, TenSp, GiaSp) values(1, 1, 'Truyện Shin cậu bé bút chì', 14500);
insert into SanPham (MaNCC, MaLoai, TenSp, GiaSp) values(1, 1, 'Truyện 7 viên ngọc rồng', 17000);

