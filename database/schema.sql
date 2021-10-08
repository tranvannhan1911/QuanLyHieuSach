CREATE DATABASE HieuSach;
GO
use HieuSach;
GO
CREATE TABLE NhanVien (MaNv int IDENTITY NOT NULL, TaiKhoanID int NOT NULL, TenNv varchar(50) NULL, SoDienThoai varchar(15) NULL, DiaChi varchar(255) NULL, CaLamViec int NULL, ChucNang int NOT NULL, CaLamViec2 int NULL, PRIMARY KEY (MaNv));
CREATE TABLE SanPham (MaSp varchar(255) NOT NULL, MaNCC int NOT NULL, MaLoai int NOT NULL, TenSp varchar(255) NULL, GiaSp float(10) NOT NULL, PRIMARY KEY (MaSp));
CREATE TABLE KhachHang (MaKh int IDENTITY NOT NULL, HoTen varchar(50) NULL, SoDienThoai varchar(15) NULL, DiaChi varchar(255) NULL, TaiKhoanID int NOT NULL, PRIMARY KEY (MaKh));
CREATE TABLE HoaDon (MaHD varchar(255) NOT NULL, MaNV int NOT NULL, MaKH int NOT NULL, TongTien float(10) NOT NULL, NgayMua date NULL, PRIMARY KEY (MaHD));
CREATE TABLE ChiTietHoaDon (ID int IDENTITY NOT NULL, MaSP varchar(255) NOT NULL, MaHD varchar(255) NOT NULL, SoLuong int NOT NULL, DonGia float(10) NOT NULL, PRIMARY KEY (ID));
CREATE TABLE TaiKhoan (ID int IDENTITY NOT NULL, TaiKhoan varchar(50) NULL, MatKhau varchar(255) NULL, PRIMARY KEY (ID));
CREATE TABLE LoaiSanPham (MaLoai int IDENTITY NOT NULL, TenLoai varchar(255) NULL, PRIMARY KEY (MaLoai));
CREATE TABLE NhaCungCap (MaNCC int IDENTITY NOT NULL, TenNCC varchar(255) NULL, DiaChi varchar(255) NULL, SoDienThoai varchar(255) NULL, PRIMARY KEY (MaNCC));
CREATE TABLE DonDatHang (MaDDH varchar(255) NOT NULL, HoaDonMaHD varchar(255) NOT NULL, KhachHangMaKh int NOT NULL, TongTien float(10) NOT NULL, NgayDat date NULL, PRIMARY KEY (MaDDH));
CREATE TABLE ChiTietDonDatHang (ID int IDENTITY NOT NULL, DonDatHangMaDDH varchar(255) NOT NULL, SanPhamMaSp varchar(255) NOT NULL, SoLuong int NOT NULL, DonGia float(10) NOT NULL, PRIMARY KEY (ID));
ALTER TABLE SanPham ADD CONSTRAINT FKSanPham622519 FOREIGN KEY (MaLoai) REFERENCES LoaiSanPham (MaLoai);
ALTER TABLE NhanVien ADD CONSTRAINT FKNhanVien63380 FOREIGN KEY (TaiKhoanID) REFERENCES TaiKhoan (ID);
ALTER TABLE SanPham ADD CONSTRAINT FKSanPham756167 FOREIGN KEY (MaNCC) REFERENCES NhaCungCap (MaNCC);
ALTER TABLE HoaDon ADD CONSTRAINT FKHoaDon785635 FOREIGN KEY (MaKH) REFERENCES KhachHang (MaKh);
ALTER TABLE HoaDon ADD CONSTRAINT FKHoaDon185080 FOREIGN KEY (MaNV) REFERENCES NhanVien (MaNv);
ALTER TABLE ChiTietHoaDon ADD CONSTRAINT FKChiTietHoa443020 FOREIGN KEY (MaHD) REFERENCES HoaDon (MaHD);
ALTER TABLE ChiTietHoaDon ADD CONSTRAINT FKChiTietHoa746460 FOREIGN KEY (MaSP) REFERENCES SanPham (MaSp);
ALTER TABLE KhachHang ADD CONSTRAINT FKKhachHang937708 FOREIGN KEY (TaiKhoanID) REFERENCES TaiKhoan (ID);
ALTER TABLE DonDatHang ADD CONSTRAINT FKDonDatHang346187 FOREIGN KEY (KhachHangMaKh) REFERENCES KhachHang (MaKh);
ALTER TABLE ChiTietDonDatHang ADD CONSTRAINT FKChiTietDon518964 FOREIGN KEY (SanPhamMaSp) REFERENCES SanPham (MaSp);
ALTER TABLE ChiTietDonDatHang ADD CONSTRAINT FKChiTietDon725158 FOREIGN KEY (DonDatHangMaDDH) REFERENCES DonDatHang (MaDDH);
ALTER TABLE DonDatHang ADD CONSTRAINT FKDonDatHang285247 FOREIGN KEY (HoaDonMaHD) REFERENCES HoaDon (MaHD);
