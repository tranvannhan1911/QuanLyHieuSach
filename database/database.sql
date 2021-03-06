create database HieuSach

GO

use HieuSach

CREATE TABLE NhanVien (
	MaNv int IDENTITY NOT NULL, 
	TaiKhoanID int NOT NULL, 
	TenNv nvarchar(50) NULL, 
	SoDienThoai varchar(15) NULL, 
	DiaChi nvarchar(255) NULL, 
	CaLamViec int default 0,
	ChucNang int default 0,
	PRIMARY KEY (MaNv)
);

CREATE TABLE SanPham (
	MaSP int IDENTITY NOT NULL, 
	MaNCC int NOT NULL, 
	MaLoai int NOT NULL, 
	TenSp nvarchar(255) NULL, 
	GiaSp float(10) NOT NULL, 
	GiaNhap float(10) NOT NULL, 
	SoLuong int default 0,
	TacGia nvarchar(50) NULL, 
	SoTrang int NULL,
	NamXuatBan int NULL,
	PRIMARY KEY (MaSP)
);

CREATE TABLE KhachHang (
	MaKH int IDENTITY NOT NULL, 
	HoTen nvarchar(50) NULL, 
	SoDienThoai varchar(15) NULL, 
	DiaChi nvarchar(255) NULL, 
	TaiKhoanID int NOT NULL, 
	PRIMARY KEY (MaKH)
);
	
CREATE TABLE HoaDon (
	MaHD int IDENTITY NOT NULL, 
	MaNV int NOT NULL, 
	MaKH int NOT NULL, 
	TongTien float(10) NOT NULL, 
	NgayMua datetime default GETDATE(),
	PRIMARY KEY (MaHD)
);


CREATE TABLE ChiTietHoaDon (
	ID int IDENTITY NOT NULL, 
	MaSP int NOT NULL, 
	MaHD int NOT NULL, 
	SoLuong int NOT NULL, 
	DonGia float(10) NOT NULL, 
	PRIMARY KEY (ID)
);

CREATE TABLE TaiKhoan (
	ID int IDENTITY NOT NULL, 
	TaiKhoan varchar(50) NULL, 
	MatKhau varchar(255) NULL, 
	PRIMARY KEY (ID)
);

CREATE TABLE LoaiSanPham (
	MaLoai int IDENTITY NOT NULL, 
	TenLoai nvarchar(255) NULL, 
	PRIMARY KEY (MaLoai)
);

CREATE TABLE NhaCungCap (
	MaNCC int IDENTITY NOT NULL, 
	TenNCC nvarchar(255) NULL, 
	DiaChi nvarchar(255) NULL, 
	SoDienThoai varchar(255) NULL, 
	PRIMARY KEY (MaNCC)
);

CREATE TABLE DonDatHang (
	MaDDH int IDENTITY NOT NULL, 
	maKH int NOT NULL, 
	TongTien float(10) NOT NULL, 
	NgayDat date NULL, 
	tinhTrang int default 0,
	PRIMARY KEY (MaDDH)
);

CREATE TABLE ChiTietDonDatHang (
	ID int IDENTITY NOT NULL, 
	MaDDH int NOT NULL, 
	MaSP int NOT NULL, 
	SoLuong int NOT NULL, 
	DonGia float(10) NOT NULL, 
	PRIMARY KEY (ID)
);

ALTER TABLE SanPham ADD CONSTRAINT FKSanPham622519 FOREIGN KEY (MaLoai) REFERENCES LoaiSanPham (MaLoai);
ALTER TABLE NhanVien ADD CONSTRAINT FKNhanVien63380 FOREIGN KEY (TaiKhoanID) REFERENCES TaiKhoan (ID);
ALTER TABLE SanPham ADD CONSTRAINT FKSanPham756167 FOREIGN KEY (MaNCC) REFERENCES NhaCungCap (MaNCC);
ALTER TABLE HoaDon ADD CONSTRAINT FKHoaDon785667 FOREIGN KEY (MaKH) REFERENCES KhachHang (MaKH);
ALTER TABLE HoaDon ADD CONSTRAINT FKHoaDon185080 FOREIGN KEY (MaNV) REFERENCES NhanVien (MaNv);
ALTER TABLE ChiTietHoaDon ADD CONSTRAINT FKChiTietHoa443020 FOREIGN KEY (MaHD) REFERENCES HoaDon (MaHD);
ALTER TABLE ChiTietHoaDon ADD CONSTRAINT FKChiTietHoa746492 FOREIGN KEY (MaSP) REFERENCES SanPham (MaSP);
ALTER TABLE DonDatHang ADD CONSTRAINT FKDonDatHang885023 FOREIGN KEY (maKH) REFERENCES KhachHang (MaKH);
ALTER TABLE ChiTietDonDatHang ADD CONSTRAINT FKChiTietDon328320 FOREIGN KEY (MaSP) REFERENCES SanPham (MaSP);
ALTER TABLE ChiTietDonDatHang ADD CONSTRAINT FKChiTietDon937162 FOREIGN KEY (MaDDH) REFERENCES DonDatHang (MaDDH);
ALTER TABLE KhachHang ADD CONSTRAINT FKKhachHang937708 FOREIGN KEY (TaiKhoanID) REFERENCES TaiKhoan (ID);

GO

-- admin
insert into TaiKhoan (TaiKhoan, MatKhau) values('admin', 'admin');
insert into KhachHang (HoTen, SoDienThoai, DiaChi, TaiKhoanID) values(N'admin', '0987654321', N'', 1);
insert into NhanVien (TenNv, SoDienThoai, DiaChi, caLamViec, chucNang, TaiKhoanID) values(N'admin', '0987654321', N'', 1, 3, 1);

-- khach hang
insert into TaiKhoan (TaiKhoan, MatKhau) values('khachhang1', 'khachhang1');
insert into KhachHang (HoTen, SoDienThoai, DiaChi, TaiKhoanID) values(N'Tr???n V??n A', '0922222222', N'H?? N???i', 2);

insert into TaiKhoan (TaiKhoan, MatKhau) values('khachhang2', 'khachhang2');
insert into KhachHang (HoTen, SoDienThoai, DiaChi, TaiKhoanID) values(N'Tr???n V??n B', '0933333333', N'H?? N???i', 3);

insert into TaiKhoan (TaiKhoan, MatKhau) values('khachhang3', 'khachhang3');
insert into KhachHang (HoTen, SoDienThoai, DiaChi, TaiKhoanID) values(N'Nguy???n Khuy???n', '0944444444', N'H?? Nam', 3);

insert into TaiKhoan (TaiKhoan, MatKhau) values('khachhang4', 'khachhang4');
insert into KhachHang (HoTen, SoDienThoai, DiaChi, TaiKhoanID) values(N'Nguy???n Ti???n V??', '0923232323', N'Nam ?????nh', 4);

insert into TaiKhoan (TaiKhoan, MatKhau) values('khachhang5', 'khachhang5');
insert into KhachHang (HoTen, SoDienThoai, DiaChi, TaiKhoanID) values(N'V?? Tr???n', '0925555553', N'Nam H???i', 5);

insert into TaiKhoan (TaiKhoan, MatKhau) values('khachhang6', 'khachhang6');
insert into KhachHang (HoTen, SoDienThoai, DiaChi, TaiKhoanID) values(N'Nguy???n Th??i V??', '0924444444', N'Ngh??? An', 6);

insert into TaiKhoan (TaiKhoan, MatKhau) values('khachhang6', 'khachhang7');
insert into KhachHang (HoTen, SoDienThoai, DiaChi, TaiKhoanID) values(N'Tr???n V??n C', '0999999999', N'H?? N???i', 7);

insert into TaiKhoan (TaiKhoan, MatKhau) values('khachhang7', 'khachhang8');
insert into KhachHang (HoTen, SoDienThoai, DiaChi, TaiKhoanID) values(N'Nguy???n V??n Khuy???n', '09456565656', N'H?? Nam Ninh', 8);

insert into TaiKhoan (TaiKhoan, MatKhau) values('khachhang8', 'khachhang9');
insert into KhachHang (HoTen, SoDienThoai, DiaChi, TaiKhoanID) values(N'Nguy???n V??n Nam', '0923238787', N'H?? T??nh', 9);

insert into TaiKhoan (TaiKhoan, MatKhau) values('khachhang10', 'khachhang11');
insert into KhachHang (HoTen, SoDienThoai, DiaChi, TaiKhoanID) values(N'V?? Tr???n Ph?????c', '0923238799', N'H??? Ch?? Minh', 10);

-- nhan vien
insert into TaiKhoan (TaiKhoan, MatKhau) values('nhanvien1', 'nhanvien1');
insert into KhachHang (HoTen, SoDienThoai, DiaChi, TaiKhoanID) values(N'Tr???n H???i', '0987654333', N'H?? N???i', 11);
insert into NhanVien (TenNv, SoDienThoai, DiaChi, caLamViec, chucNang, TaiKhoanID) values(N'Tr???n H???i', '0987654333', N'H?? N???i', 1, 1, 11);

insert into TaiKhoan (TaiKhoan, MatKhau) values('nhanvien2', 'nhanvien2');
insert into KhachHang (HoTen, SoDienThoai, DiaChi, TaiKhoanID) values(N'Tr???n Ph?????c', '0923238222', N'H?? N???i', 12);
insert into NhanVien (TenNv, SoDienThoai, DiaChi, caLamViec, chucNang, TaiKhoanID) values(N'Tr???n Ph?????c', '0923238222', N'H?? N???i', 2, 2, 12);

insert into TaiKhoan (TaiKhoan, MatKhau) values('nhanvien3', 'nhanvien3');
insert into KhachHang (HoTen, SoDienThoai, DiaChi, TaiKhoanID) values(N'Phan ????nh Ph????ng', '0354043344', N'H???i Ph??ng', 13);
insert into NhanVien (TenNv, SoDienThoai, DiaChi, caLamViec, chucNang, TaiKhoanID) values(N'Phan ????nh Ph????ng', '0354043344', N'H???i Ph??ng', 2, 2, 13);

insert into TaiKhoan (TaiKhoan, MatKhau) values('nhanvien4', 'nhanvien4');
insert into KhachHang (HoTen, SoDienThoai, DiaChi, TaiKhoanID) values(N'Tr???n V??n Nh??n', '0977965717', N'H???i D????ng', 14);
insert into NhanVien (TenNv, SoDienThoai, DiaChi, caLamViec, chucNang, TaiKhoanID) values(N'Tr???n V??n Nh??n', '0354043344', N'H???i D????ng', 1, 1, 14);

insert into TaiKhoan (TaiKhoan, MatKhau) values('nhanvien5', 'nhanvien5');
insert into KhachHang (HoTen, SoDienThoai, DiaChi, TaiKhoanID) values(N'L?? ????nh Vi???t', '0355414564', N'Tuy??n Quang', 15);
insert into NhanVien (TenNv, SoDienThoai, DiaChi, caLamViec, chucNang, TaiKhoanID) values(N'L?? ????nh Vi???t', '0354043344', N'Tuy??n Quang', 2, 2, 15);


-- Nha Cung Cap
insert into NhaCungCap (tenNCC, DiaChi, SoDienThoai) values(N'Kim ?????ng', N'H?? N???i', '0987654321');
insert into NhaCungCap (tenNCC, DiaChi, SoDienThoai) values(N'Thi??n kim', N'H?? N???i', '0987654322');
insert into NhaCungCap (tenNCC, DiaChi, SoDienThoai) values(N'H?? N???i', N'H?? N???i', '0987654222');
insert into NhaCungCap (tenNCC, DiaChi, SoDienThoai) values(N'Thi??n Long', N'H??? Ch?? Minh', '0987654324');
insert into NhaCungCap (tenNCC, DiaChi, SoDienThoai) values(N'Long H???i', N'Ninh B??nh', '0987654234');
insert into NhaCungCap (tenNCC, DiaChi, SoDienThoai) values(N'Thi??n Ph?????c', N'H??? Ch?? Minh', '0987654356');
insert into NhaCungCap (tenNCC, DiaChi, SoDienThoai) values(N'Th??? gi???i', N'H??? Ch?? Minh', '0976214532');

-- Loai San Pham
insert into LoaiSanPham (TenLoai) values(N'S??ch t??m l??');
insert into LoaiSanPham (TenLoai) values(N'S??ch gi??o khoa');
insert into LoaiSanPham (TenLoai) values(N'Truy???n trinh th??m');
insert into LoaiSanPham (TenLoai) values(N'Truy???n c??? t??ch');
insert into LoaiSanPham (TenLoai) values(N'B??t');
insert into LoaiSanPham (TenLoai) values(N'V??? vi???t');
insert into LoaiSanPham (TenLoai) values(N'Th?????c k???');
insert into LoaiSanPham (TenLoai) values(N'M??y t??nh c???m tay');
insert into LoaiSanPham (TenLoai) values(N'S??ch thi???u nhi');
insert into LoaiSanPham (TenLoai) values(N'S??ch ch??nh tr???');
insert into LoaiSanPham (TenLoai) values(N'Truy???n ng??n t??nh');
insert into LoaiSanPham (TenLoai) values(N'S??ch khoa h???c');
insert into LoaiSanPham (TenLoai) values(N'Truy???n kinh d???');


-- San Pham
insert into SanPham (MaNCC, MaLoai, TenSp, GiaSp, GiaNhap, SoLuong, TacGia, soTrang, namXuatBan) values(1, 2, N'S??ch ti???ng vi???t 1', 15000, 13000, 50, N'S??? gi??o d???c', 200, 2020);
insert into SanPham (MaNCC, MaLoai, TenSp, GiaSp, GiaNhap, SoLuong, TacGia, soTrang, namXuatBan) values(2, 2, N'S??ch ti???ng vi???t 2', 16000, 13000, 50, N'S??? gi??o d???c', 150, 2020);
insert into SanPham (MaNCC, MaLoai, TenSp, GiaSp, GiaNhap, SoLuong, TacGia, soTrang, namXuatBan) values(1, 2, N'S??ch to??n 1', 14500, 13000, 50, N'S??? gi??o d???c', 140, 2021);
insert into SanPham (MaNCC, MaLoai, TenSp, GiaSp, GiaNhap, SoLuong, TacGia, soTrang, namXuatBan) values(4, 2, N'S??ch to??n 2', 17000, 13000, 50, N'S??? gi??o d???c', 170, 2021);
insert into SanPham (MaNCC, MaLoai, TenSp, GiaSp, GiaNhap, SoLuong, TacGia, soTrang, namXuatBan) values(3, 2, N'S??ch ?????o ?????c 1', 17000, 13000, 50, N'S??? gi??o d???c', 170, 2019);
insert into SanPham (MaNCC, MaLoai, TenSp, GiaSp, GiaNhap, SoLuong, TacGia, soTrang, namXuatBan) values(3, 2, N'S??ch v???t l?? l???p 7', 17000, 13000, 50, N'S??? gi??o d???c', 170, 2019);
insert into SanPham (MaNCC, MaLoai, TenSp, GiaSp, GiaNhap, SoLuong, TacGia, soTrang, namXuatBan) values(3, 2, N'S??ch to??n 7 t???p 1', 17000, 13000, 50, N'S??? gi??o d???c', 170, 2019);
insert into SanPham (MaNCC, MaLoai, TenSp, GiaSp, GiaNhap, SoLuong, TacGia, soTrang, namXuatBan) values(3, 2, N'S??ch to??n 7 t???p 2', 17000, 13000, 50, N'S??? gi??o d???c', 170, 2019);
insert into SanPham (MaNCC, MaLoai, TenSp, GiaSp, GiaNhap, SoLuong, TacGia, soTrang, namXuatBan) values(3, 2, N'S??ch Ng??? v??n 7 t???p 1', 17000, 13000, 50, N'S??? gi??o d???c', 170, 2019);
insert into SanPham (MaNCC, MaLoai, TenSp, GiaSp, GiaNhap, SoLuong, TacGia, soTrang, namXuatBan) values(3, 2, N'S??ch Ng??? v??n 7 t???p 2', 17000, 13000, 50, N'S??? gi??o d???c', 170, 2019);

insert into SanPham (MaNCC, MaLoai, TenSp, GiaSp, GiaNhap, SoLuong, TacGia, soTrang, namXuatBan) values(7, 1, N'Nh???ng k??? xu???t ch??ng', 150000, 130000, 50, N'Malcolm Gladwell', 304, 2008);
insert into SanPham (MaNCC, MaLoai, TenSp, GiaSp, GiaNhap, SoLuong, TacGia, soTrang, namXuatBan) values(3, 1, N'T?? duy nhanh v?? ch???m', 170000, 140000, 50, N'Daniel Kahneman', 170, 2019);
insert into SanPham (MaNCC, MaLoai, TenSp, GiaSp, GiaNhap, SoLuong, TacGia, soTrang, namXuatBan) values(3, 1, N'The Happiness Hypothesis', 170000, 130000, 50, N'Jonathan Haidt', 320, 2006);
insert into SanPham (MaNCC, MaLoai, TenSp, GiaSp, GiaNhap, SoLuong, TacGia, soTrang, namXuatBan) values(3, 1, N'N???n v??n minh v?? s??? b???t m??n c???a n??', 170000, 130000, 50, N'Sigmund Freud', 127, 2019);

insert into SanPham (MaNCC, MaLoai, TenSp, GiaSp, GiaNhap, SoLuong, TacGia, soTrang, namXuatBan) values(3, 3, N'Truy???n conan t???p 1', 17500, 16000, 50, N'Aoyama Gosho', 90, 2016);
insert into SanPham (MaNCC, MaLoai, TenSp, GiaSp, GiaNhap, SoLuong, TacGia, soTrang, namXuatBan) values(3, 3, N'Truy???n conan t???p 2', 17500, 16000, 50, N'Aoyama Gosho', 90, 2016);
insert into SanPham (MaNCC, MaLoai, TenSp, GiaSp, GiaNhap, SoLuong, TacGia, soTrang, namXuatBan) values(3, 3, N'Truy???n conan t???p 3', 17500, 16000, 50, N'Aoyama Gosho', 90, 2016);
insert into SanPham (MaNCC, MaLoai, TenSp, GiaSp, GiaNhap, SoLuong, TacGia, soTrang, namXuatBan) values(3, 3, N'Truy???n doraemon t???p 1', 18500, 16000, 50, N'Fujiko Fujio', 90, 2014);
insert into SanPham (MaNCC, MaLoai, TenSp, GiaSp, GiaNhap, SoLuong, TacGia, soTrang, namXuatBan) values(3, 3, N'Truy???n doraemon t???p 2', 18500, 16000, 50, N'Fujiko Fujio', 90, 2014);
insert into SanPham (MaNCC, MaLoai, TenSp, GiaSp, GiaNhap, SoLuong, TacGia, soTrang, namXuatBan) values(3, 3, N'Truy???n doraemon t???p 3', 18500, 16000, 50, N'Fujiko Fujio', 90, 2014);
insert into SanPham (MaNCC, MaLoai, TenSp, GiaSp, GiaNhap, SoLuong, TacGia, soTrang, namXuatBan) values(1, 3, N'??i???p vi??n k??? qu??i', 185000, 160000, 50, N'Nguy???t Tri', 130, 2014);
insert into SanPham (MaNCC, MaLoai, TenSp, GiaSp, GiaNhap, SoLuong, TacGia, soTrang, namXuatBan) values(1, 3, N'H??? s?? b?? ???n', 185000, 160000, 50, N'Kh??? K??? K???', 137, 2014);
insert into SanPham (MaNCC, MaLoai, TenSp, GiaSp, GiaNhap, SoLuong, TacGia, soTrang, namXuatBan) values(1, 3, N'????? thi ?????m m??u', 185000, 160000, 50, N'L??i M???', 304, 2015);
insert into SanPham (MaNCC, MaLoai, TenSp, GiaSp, GiaNhap, SoLuong, TacGia, soTrang, namXuatBan) values(1, 3, N'??n m???ng tr??n s??ng Nile', 185000, 160000, 50, N'Agatha Christie', 324, 2015);

insert into SanPham (MaNCC, MaLoai, TenSp, GiaSp, GiaNhap, SoLuong, TacGia, soTrang, namXuatBan) values(3, 4, N'T???m C??m', 17500, 16000, 50, N'Nhi???u t??c gi???', 21, 2016);
insert into SanPham (MaNCC, MaLoai, TenSp, GiaSp, GiaNhap, SoLuong, TacGia, soTrang, namXuatBan) values(3, 4, N'C??y tre tr??m ?????t', 17500, 16000, 50, N'Nhi???u t??c gi???', 16, 2016);
insert into SanPham (MaNCC, MaLoai, TenSp, GiaSp, GiaNhap, SoLuong, TacGia, soTrang, namXuatBan) values(3, 4, N'S??? d???a', 17500, 16000, 50, N'Nhi???u t??c gi???', 17, 2016);
insert into SanPham (MaNCC, MaLoai, TenSp, GiaSp, GiaNhap, SoLuong, TacGia, soTrang, namXuatBan) values(1, 4, N'Th???ch Sanh', 17500, 16000, 50, N'Nguy???n M???nh Th??i', 20, 2019);
insert into SanPham (MaNCC, MaLoai, TenSp, GiaSp, GiaNhap, SoLuong, TacGia, soTrang, namXuatBan) values(1, 4, N'Th??nh Gi??ng', 17500, 16000, 50, N'Minh Long', 30, 2016);
insert into SanPham (MaNCC, MaLoai, TenSp, GiaSp, GiaNhap, SoLuong, TacGia, soTrang, namXuatBan) values(3, 4, N'C?? b?? l??? lem', 17500, 16000, 50, N'Nhi???u t??c gi???', 10, 2016);
insert into SanPham (MaNCC, MaLoai, TenSp, GiaSp, GiaNhap, SoLuong, TacGia, soTrang, namXuatBan) values(1, 4, N'C?? b?? b??n di??m', 17500, 16000, 50, N'Tri???u Ph????ng Ph????ng', 18, 2019);
insert into SanPham (MaNCC, MaLoai, TenSp, GiaSp, GiaNhap, SoLuong, TacGia, soTrang, namXuatBan) values(1, 4, N'N??ng B???ch Tuy???t v?? b???y ch?? l??n', 17500, 16000, 50, N'Nhi???u t??c gi???', 24, 2020);

insert into SanPham (MaNCC, MaLoai, TenSp, GiaSp, GiaNhap, SoLuong) values(5, 5, N'B??t bi', 5000, 4500, 50);
insert into SanPham (MaNCC, MaLoai, TenSp, GiaSp, GiaNhap, SoLuong) values(6, 5, N'B??t ch??', 6000, 4500, 50);

insert into SanPham (MaNCC, MaLoai, TenSp, GiaSp, GiaNhap, SoLuong) values(5, 6, N'V??? 5 ?? ly', 5000, 4500, 50);
insert into SanPham (MaNCC, MaLoai, TenSp, GiaSp, GiaNhap, SoLuong) values(6, 6, N'V??? 4 ?? ly', 6000, 4500, 50);
insert into SanPham (MaNCC, MaLoai, TenSp, GiaSp, GiaNhap, SoLuong) values(5, 6, N'V??? ghi ch?? c???m tay', 5500, 4500, 50);
insert into SanPham (MaNCC, MaLoai, TenSp, GiaSp, GiaNhap, SoLuong) values(6, 6, N'V??? 200 trang', 6000, 4500, 50);

insert into SanPham (MaNCC, MaLoai, TenSp, GiaSp, GiaNhap, SoLuong) values(5, 7, N'Th?????c k??? 20cm', 5000, 4500, 50);
insert into SanPham (MaNCC, MaLoai, TenSp, GiaSp, GiaNhap, SoLuong) values(6, 7, N'Th?????c ??o ?????', 6000, 4500, 50);
insert into SanPham (MaNCC, MaLoai, TenSp, GiaSp, GiaNhap, SoLuong) values(5, 7, N'Th?????c ??o tam gi??c', 5500, 4500, 50);
insert into SanPham (MaNCC, MaLoai, TenSp, GiaSp, GiaNhap, SoLuong) values(6, 7, N'Th?????c g??? 30cm', 15000, 14500, 50);

insert into SanPham (MaNCC, MaLoai, TenSp, GiaSp, GiaNhap, SoLuong) values(5, 8, N'Casio fx570es', 500000, 400000, 50);
insert into SanPham (MaNCC, MaLoai, TenSp, GiaSp, GiaNhap, SoLuong) values(6, 8, N'Casio fx570vn', 650000, 550000, 50);
insert into SanPham (MaNCC, MaLoai, TenSp, GiaSp, GiaNhap, SoLuong) values(6, 8, N'Casio FX 570VN Plus', 680000, 570000, 50);
insert into SanPham (MaNCC, MaLoai, TenSp, GiaSp, GiaNhap, SoLuong) values(6, 8, N'Vinacal 570ES Plus', 680000, 570000, 50);
insert into SanPham (MaNCC, MaLoai, TenSp, GiaSp, GiaNhap, SoLuong) values(6, 8, N'Vinacal 570EX Plus', 650000, 550000, 50);

insert into SanPham (MaNCC, MaLoai, TenSp, GiaSp, GiaNhap, SoLuong, TacGia, soTrang, namXuatBan) values(1, 9, N'Kh??ng gia ????nh', 250000, 230000, 50, N'Hector Malot', 300, 2017);
insert into SanPham (MaNCC, MaLoai, TenSp, GiaSp, GiaNhap, SoLuong, TacGia, soTrang, namXuatBan) values(3, 9, N'Nh???ng t???m l??ng cao c???', 250000, 230000, 50, N'Edomondo De Amicis', 200, 2020);
insert into SanPham (MaNCC, MaLoai, TenSp, GiaSp, GiaNhap, SoLuong, TacGia, soTrang, namXuatBan) values(1, 9, N'D??? M??n phi??u l??u k??', 150000, 130000, 50, N'T?? Ho??i', 230, 2020);
insert into SanPham (MaNCC, MaLoai, TenSp, GiaSp, GiaNhap, SoLuong, TacGia, soTrang, namXuatBan) values(3, 9, N'?????t r???ng ph????ng Nam', 170000, 130000, 50, N'??o??n Gi???i', 204, 2020);
insert into SanPham (MaNCC, MaLoai, TenSp, GiaSp, GiaNhap, SoLuong, TacGia, soTrang, namXuatBan) values(3, 9, N'C??i t???t c???a m??o con', 70000, 50000, 50, N'Nguy???n ????nh Thi', 70, 2020);
insert into SanPham (MaNCC, MaLoai, TenSp, GiaSp, GiaNhap, SoLuong, TacGia, soTrang, namXuatBan) values(1, 9, N'B???u tr???i trong qu??? tr???ng', 15000, 13000, 50, N'Xu??n Qu???nh', 30, 2018);
insert into SanPham (MaNCC, MaLoai, TenSp, GiaSp, GiaNhap, SoLuong, TacGia, soTrang, namXuatBan) values(3, 9, N'Tu???i th?? d??? d???i', 15000, 13000, 50, N'Ph??ng Qu??n', 20, 2020);
insert into SanPham (MaNCC, MaLoai, TenSp, GiaSp, GiaNhap, SoLuong, TacGia, soTrang, namXuatBan) values(1, 9, N'Chuy???n hoa chuy???n qu???', 15000, 13000, 50, N'Ph???m H???', 20, 2020);

insert into SanPham (MaNCC, MaLoai, TenSp, GiaSp, GiaNhap, SoLuong, TacGia, soTrang, namXuatBan) values(7, 10, N'C???ng h??a', 140000, 130000, 50, N'Plato', 200, 2020);
insert into SanPham (MaNCC, MaLoai, TenSp, GiaSp, GiaNhap, SoLuong, TacGia, soTrang, namXuatBan) values(7, 10, N'Th??? gi???i cho ?????n ng??y h??m qua', 250000, 230000, 50, N'Jared Diamond', 250, 2020);
insert into SanPham (MaNCC, MaLoai, TenSp, GiaSp, GiaNhap, SoLuong, TacGia, soTrang, namXuatBan) values(1, 10, N'S???p ?????', 150000, 130000, 50, N'Jared Diamond', 200, 2019);
insert into SanPham (MaNCC, MaLoai, TenSp, GiaSp, GiaNhap, SoLuong, TacGia, soTrang, namXuatBan) values(3, 10, N'M???t t?? duy kh??c v??? kinh t??? v?? x?? h???i Vi???t Nam', 170000, 130000, 50, N'Alan Phan', 200, 2020);
insert into SanPham (MaNCC, MaLoai, TenSp, GiaSp, GiaNhap, SoLuong, TacGia, soTrang, namXuatBan) values(1, 10, N'Ti???n kh??ng mua ???????c g??', 150000, 130000, 50, N'Michael J. Sandel', 205, 2019);
insert into SanPham (MaNCC, MaLoai, TenSp, GiaSp, GiaNhap, SoLuong, TacGia, soTrang, namXuatBan) values(7, 10, N'G?? kh???ng l??? m???t ng???', 17000, 130000, 50, N'Susan L. Shirk', 200, 2020);
insert into SanPham (MaNCC, MaLoai, TenSp, GiaSp, GiaNhap, SoLuong, TacGia, soTrang, namXuatBan) values(7, 10, N'H???i k?? ch??nh tr???', 15000, 13000, 50, N'Dr Mahathir', 302, 2020);


insert into SanPham (MaNCC, MaLoai, TenSp, GiaSp, GiaNhap, SoLuong, TacGia, soTrang, namXuatBan) values(3, 11, N'Anh c?? th??ch n?????c M??? kh??ng?', 150000, 130000, 50, N'T??n Di ???', 200, 2020);
insert into SanPham (MaNCC, MaLoai, TenSp, GiaSp, GiaNhap, SoLuong, TacGia, soTrang, namXuatBan) values(3, 11, N'T???ng c?? m???t ng?????i y??u t??i nh?? sinh m???nh', 15000, 13000, 50, N'Th?? Nghi', 210, 2018);
insert into SanPham (MaNCC, MaLoai, TenSp, GiaSp, GiaNhap, SoLuong, TacGia, soTrang, namXuatBan) values(1, 11, N'????ng ti???c kh??ng ph???i anh', 210000, 180000, 50, N'Di???p T???', 300, 2020);
insert into SanPham (MaNCC, MaLoai, TenSp, GiaSp, GiaNhap, SoLuong, TacGia, soTrang, namXuatBan) values(3, 11, N'Th???t t???ch kh??ng m??a', 160000, 130000, 50, N'L??u V?? T??nh', 200, 2020);
insert into SanPham (MaNCC, MaLoai, TenSp, GiaSp, GiaNhap, SoLuong, TacGia, soTrang, namXuatBan) values(3, 11, N'S??? c?? thi??n th???n thay anh y??u em', 190000, 170000, 50, N'Minh Hi???u Kh??', 205, 2020);
insert into SanPham (MaNCC, MaLoai, TenSp, GiaSp, GiaNhap, SoLuong, TacGia, soTrang, namXuatBan) values(1, 11, N'???c s??n ch???y', 150000, 130000, 50, N'??i???p Ch?? Linh', 201, 2020);
insert into SanPham (MaNCC, MaLoai, TenSp, GiaSp, GiaNhap, SoLuong, TacGia, soTrang, namXuatBan) values(1, 11, N'B???n xe', 150000, 130000, 50, N'Th????ng Th??i Vi', 200, 2020);
insert into SanPham (MaNCC, MaLoai, TenSp, GiaSp, GiaNhap, SoLuong, TacGia, soTrang, namXuatBan) values(1, 11, N'M??i m??i l?? bao xa', 150000, 130000, 50, N'Di???p L???c V?? T??m', 203, 2020);

insert into SanPham (MaNCC, MaLoai, TenSp, GiaSp, GiaNhap, SoLuong, TacGia, soTrang, namXuatBan) values(3, 12, N'L?????c s??? th???i gian', 240000, 230000, 50, N'Stephen Hawking', 256, 2017);
insert into SanPham (MaNCC, MaLoai, TenSp, GiaSp, GiaNhap, SoLuong, TacGia, soTrang, namXuatBan) values(1, 12, N'Ngu???n g???c c??c lo??i', 300000, 270000, 50, N'Charles Darwin', 496, 2020);
insert into SanPham (MaNCC, MaLoai, TenSp, GiaSp, GiaNhap, SoLuong, TacGia, soTrang, namXuatBan) values(1, 12, N'Nh???ng nh?? kh??m ph??', 250000, 230000, 50, N'Daniel J. Boorstin', 745, 2020);
insert into SanPham (MaNCC, MaLoai, TenSp, GiaSp, GiaNhap, SoLuong, TacGia, soTrang, namXuatBan) values(1, 12, N'B???n thi???t k??? v?? ?????i', 150000, 130000, 50, N'S??? gi??o d???c', 208, 2020);
insert into SanPham (MaNCC, MaLoai, TenSp, GiaSp, GiaNhap, SoLuong, TacGia, soTrang, namXuatBan) values(1, 12, N'S??ng, vi tr??ng v?? th??p', 300000, 270000, 50, N'Jared Diamond', 676, 2019);
insert into SanPham (MaNCC, MaLoai, TenSp, GiaSp, GiaNhap, SoLuong, TacGia, soTrang, namXuatBan) values(1, 12, N'M??a xu??n v???ng l???ng', 150000, 130000, 50, N'Rachel Carson', 200, 2020);

insert into SanPham (MaNCC, MaLoai, TenSp, GiaSp, GiaNhap, SoLuong, TacGia, soTrang, namXuatBan) values(1, 13, N'K??? ??n ??nh tr??ng', 150000, 130000, 50, N'Q???y C??? N???', 306, 2020);
insert into SanPham (MaNCC, MaLoai, TenSp, GiaSp, GiaNhap, SoLuong, TacGia, soTrang, namXuatBan) values(1, 13, N'H??? Tuy???t M???nh', 140000, 120000, 50, N'Q???y C??? N???', 250, 2020);
insert into SanPham (MaNCC, MaLoai, TenSp, GiaSp, GiaNhap, SoLuong, TacGia, soTrang, namXuatBan) values(1, 13, N'Th???y xa qu??n', 70000, 40000, 50, N'Yukito Ayatsuji', 110, 2020);
insert into SanPham (MaNCC, MaLoai, TenSp, GiaSp, GiaNhap, SoLuong, TacGia, soTrang, namXuatBan) values(3, 13, N'Gi??? thuy???t th??? 7', 57000, 40000, 50, N'Paul Halter', 200, 2020);
insert into SanPham (MaNCC, MaLoai, TenSp, GiaSp, GiaNhap, SoLuong, TacGia, soTrang, namXuatBan) values(1, 13, N'Ring ??? V??ng Tr??n ??c Nghi???t', 140000, 130000, 50, N'Suzuki K??ji', 200, 2020);
insert into SanPham (MaNCC, MaLoai, TenSp, GiaSp, GiaNhap, SoLuong, TacGia, soTrang, namXuatBan) values(1, 13, N'T?? ?????ng r??? m??u', 84000, 70000, 50, N'Q???y C??? N???', 168, 2019);
insert into SanPham (MaNCC, MaLoai, TenSp, GiaSp, GiaNhap, SoLuong, TacGia, soTrang, namXuatBan) values(1, 13, N'??au th????ng ?????n ch???t', 150000, 130000, 50, N'Q???y C??? N???', 170, 2020);


--H??a ????n
insert into HoaDon(MaNV, MaKH,TongTien,NgayMua) values(1, 3,235000,'2021-12-21 20:22:21');
insert into ChiTietHoaDon(MaSP, MaHD, SoLuong,DonGia) values(1, 1, 1, 15000);
insert into ChiTietHoaDon(MaSP, MaHD, SoLuong,DonGia) values(2, 1, 1, 16000);
insert into ChiTietHoaDon(MaSP, MaHD, SoLuong,DonGia) values(5, 1, 1, 17000);
insert into ChiTietHoaDon(MaSP, MaHD, SoLuong,DonGia) values(7, 1, 1, 17000);
insert into ChiTietHoaDon(MaSP, MaHD, SoLuong,DonGia) values(12, 1, 1, 170000);

insert into HoaDon(MaNV, MaKH,TongTien,NgayMua) values(1, 4,330000,'2021-11-20 21:46:43.150');
insert into ChiTietHoaDon(MaSP, MaHD, SoLuong,DonGia) values(33, 2, 1, 5000);
insert into ChiTietHoaDon(MaSP, MaHD, SoLuong,DonGia) values(35, 2, 1, 5000);
insert into ChiTietHoaDon(MaSP, MaHD, SoLuong,DonGia) values(11, 2, 1, 150000);
insert into ChiTietHoaDon(MaSP, MaHD, SoLuong,DonGia) values(13, 2, 1, 170000);

insert into HoaDon(MaNV, MaKH,TongTien,NgayMua) values(1, 5,261000,'2021-10-17 15:30:21.150');
insert into ChiTietHoaDon(MaSP, MaHD, SoLuong,DonGia) values(5, 3, 2, 17000);
insert into ChiTietHoaDon(MaSP, MaHD, SoLuong,DonGia) values(6, 3, 1, 17000);
insert into ChiTietHoaDon(MaSP, MaHD, SoLuong,DonGia) values(25, 3, 3, 17500);
insert into ChiTietHoaDon(MaSP, MaHD, SoLuong,DonGia) values(27, 3, 4, 17500);
insert into ChiTietHoaDon(MaSP, MaHD, SoLuong,DonGia) values(30, 3, 5, 17500);

insert into HoaDon(MaNV, MaKH,TongTien,NgayMua) values(1, 6,878500,'2021-11-12 14:35:25.150');
insert into ChiTietHoaDon(MaSP, MaHD, SoLuong,DonGia) values(45, 4, 1, 680000);
insert into ChiTietHoaDon(MaSP, MaHD, SoLuong,DonGia) values(36, 4, 1, 6000);
insert into ChiTietHoaDon(MaSP, MaHD, SoLuong,DonGia) values(25, 4, 2, 17500);
insert into ChiTietHoaDon(MaSP, MaHD, SoLuong,DonGia) values(28, 4, 3, 17500);
insert into ChiTietHoaDon(MaSP, MaHD, SoLuong,DonGia) values(32, 4, 6, 17500);

insert into HoaDon(MaNV, MaKH,TongTien,NgayMua) values(1, 6,4787500,'2021-12-13 12:40:25.150');
insert into ChiTietHoaDon(MaSP, MaHD, SoLuong,DonGia) values(17, 5, 15, 17500);
insert into ChiTietHoaDon(MaSP, MaHD, SoLuong,DonGia) values(19, 5, 17, 18500);
insert into ChiTietHoaDon(MaSP, MaHD, SoLuong,DonGia) values(24, 5, 20, 185000);
insert into ChiTietHoaDon(MaSP, MaHD, SoLuong,DonGia) values(26, 5, 23, 17500);
insert into ChiTietHoaDon(MaSP, MaHD, SoLuong,DonGia) values(36, 5, 18, 6000);

insert into HoaDon(MaNV, MaKH,TongTien,NgayMua) values(1, 7,10117500,'2021-11-13 17:35:25.150');
insert into ChiTietHoaDon(MaSP, MaHD, SoLuong,DonGia) values(46, 6, 3, 680000);
insert into ChiTietHoaDon(MaSP, MaHD, SoLuong,DonGia) values(14, 6, 19, 170000);
insert into ChiTietHoaDon(MaSP, MaHD, SoLuong,DonGia) values(24, 6, 21, 185000);
insert into ChiTietHoaDon(MaSP, MaHD, SoLuong,DonGia) values(28, 6, 30, 17500);
insert into ChiTietHoaDon(MaSP, MaHD, SoLuong,DonGia) values(32, 6, 25, 17500);

insert into HoaDon(MaNV, MaKH,TongTien,NgayMua) values(1, 8,12822500,'2021-11-19 14:35:25.150');
insert into ChiTietHoaDon(MaSP, MaHD, SoLuong,DonGia) values(22, 7, 21, 185000);
insert into ChiTietHoaDon(MaSP, MaHD, SoLuong,DonGia) values(23, 7, 21, 185000);
insert into ChiTietHoaDon(MaSP, MaHD, SoLuong,DonGia) values(24, 7, 22, 185000);
insert into ChiTietHoaDon(MaSP, MaHD, SoLuong,DonGia) values(25, 7, 31, 17500);
insert into ChiTietHoaDon(MaSP, MaHD, SoLuong,DonGia) values(26, 7, 6, 17500);
insert into ChiTietHoaDon(MaSP, MaHD, SoLuong,DonGia) values(32, 7, 14, 17500);
insert into ChiTietHoaDon(MaSP, MaHD, SoLuong,DonGia) values(34, 7, 15, 6000);

insert into HoaDon(MaNV, MaKH,TongTien,NgayMua) values(1, 9,2786500,'2021-12-11 11:35:25.150');
insert into ChiTietHoaDon(MaSP, MaHD, SoLuong,DonGia) values(1, 8, 30, 15000);
insert into ChiTietHoaDon(MaSP, MaHD, SoLuong,DonGia) values(3, 8, 31, 14500);
insert into ChiTietHoaDon(MaSP, MaHD, SoLuong,DonGia) values(5, 8, 26, 17000);
insert into ChiTietHoaDon(MaSP, MaHD, SoLuong,DonGia) values(7, 8, 37, 17000);
insert into ChiTietHoaDon(MaSP, MaHD, SoLuong,DonGia) values(8, 8, 16, 17000);
insert into ChiTietHoaDon(MaSP, MaHD, SoLuong,DonGia) values(9, 8, 16, 17000);
insert into ChiTietHoaDon(MaSP, MaHD, SoLuong,DonGia) values(10, 8, 16, 17000);


insert into HoaDon(MaNV, MaKH,TongTien,NgayMua) values(1, 14,5110000,'2021-11-18 14:3:25.150');
insert into ChiTietHoaDon(MaSP, MaHD, SoLuong,DonGia) values(45, 9, 1, 680000);
insert into ChiTietHoaDon(MaSP, MaHD, SoLuong,DonGia) values(46, 9, 1, 680000);
insert into ChiTietHoaDon(MaSP, MaHD, SoLuong,DonGia) values(47, 9, 2, 650000);
insert into ChiTietHoaDon(MaSP, MaHD, SoLuong,DonGia) values(48, 9, 2, 250000);
insert into ChiTietHoaDon(MaSP, MaHD, SoLuong,DonGia) values(50, 9, 5, 150000);
insert into ChiTietHoaDon(MaSP, MaHD, SoLuong,DonGia) values(51, 9, 5, 170000);
insert into ChiTietHoaDon(MaSP, MaHD, SoLuong,DonGia) values(52, 9, 5, 70000);

insert into HoaDon(MaNV, MaKH,TongTien,NgayMua) values(1, 16,2265000,'2021-11-19 10:35:25.150');
insert into ChiTietHoaDon(MaSP, MaHD, SoLuong,DonGia) values(45, 10, 1, 680000);
insert into ChiTietHoaDon(MaSP, MaHD, SoLuong,DonGia) values(36, 10, 25, 6000);
insert into ChiTietHoaDon(MaSP, MaHD, SoLuong,DonGia) values(25, 10, 23, 17500);
insert into ChiTietHoaDon(MaSP, MaHD, SoLuong,DonGia) values(28, 10, 33, 17500);
insert into ChiTietHoaDon(MaSP, MaHD, SoLuong,DonGia) values(32, 10, 26, 17500);


-- ????n ?????t h??ng
insert into DonDatHang(maKH, TongTien, NgayDat,tinhTrang) values(7,2265000,'2021-11-14 10:35:25.150',1)
insert into ChiTietDonDatHang(MaDDH,MaSP,SoLuong,DonGia) values(1,45,1,680000)
insert into ChiTietDonDatHang(MaDDH,MaSP,SoLuong,DonGia) values(1,36,25,6000)
insert into ChiTietDonDatHang(MaDDH,MaSP,SoLuong,DonGia) values(1,25,23,17500)
insert into ChiTietDonDatHang(MaDDH,MaSP,SoLuong,DonGia) values(1,28,33,17500)
insert into ChiTietDonDatHang(MaDDH,MaSP,SoLuong,DonGia) values(1,32,26,17500)

insert into DonDatHang(maKH, TongTien, NgayDat,tinhTrang) values(8,2786500,'2021-11-17 9:35:25.150',1)
insert into ChiTietDonDatHang(MaDDH,MaSP,SoLuong,DonGia) values(2,1,30, 15000)
insert into ChiTietDonDatHang(MaDDH,MaSP,SoLuong,DonGia) values(2,3,31, 14500)
insert into ChiTietDonDatHang(MaDDH,MaSP,SoLuong,DonGia) values(2,5,26, 17000)
insert into ChiTietDonDatHang(MaDDH,MaSP,SoLuong,DonGia) values(2,7,37, 17000)
insert into ChiTietDonDatHang(MaDDH,MaSP,SoLuong,DonGia) values(2,8,16, 17000)
insert into ChiTietDonDatHang(MaDDH,MaSP,SoLuong,DonGia) values(2,9,16, 17000)
insert into ChiTietDonDatHang(MaDDH,MaSP,SoLuong,DonGia) values(2,10,16, 17000)








