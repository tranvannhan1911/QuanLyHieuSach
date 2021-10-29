package entity;

public class NhanVienQLSanPham extends NhanVien {
	private int caLamViec;

	public NhanVienQLSanPham(int maNv, String tenNv, String soDienThoai, String diaChi, TaiKhoan taiKhoan, int caLamViec) {
		super(maNv, tenNv, soDienThoai, diaChi, taiKhoan);
		this.caLamViec = caLamViec;
	}

	public int getCaLamViec() {
		return caLamViec;
	}

	public void setCaLamViec(int caLamViec) {
		this.caLamViec = caLamViec;
	}

	@Override
	public String toString() {
		return "NhanVienQLSanPham [caLamViec=" + caLamViec + ", taiKhoan=" + taiKhoan + "]";
	}
	
	
}