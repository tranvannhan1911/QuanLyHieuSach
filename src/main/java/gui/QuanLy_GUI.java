package gui;

import java.awt.BorderLayout;
import java.awt.EventQueue;
import java.awt.event.ActionEvent;
import java.awt.event.ActionListener;
import java.sql.SQLException;

import javax.swing.JFrame;
import javax.swing.JPanel;
import javax.swing.Popup;
import javax.swing.border.EmptyBorder;
import javax.swing.event.MenuEvent;
import javax.swing.event.MenuListener;

import dao.KhachHangDAO;
import dao.NhanVienDAO;
import dao.TaiKhoanDAO;
import entity.KhachHang;
import entity.NhanVien;
import entity.TaiKhoan;

import javax.swing.JMenuBar;
import javax.swing.JMenu;
import javax.swing.JMenuItem;
import javax.swing.JOptionPane;

public class QuanLy_GUI extends JFrame {

	private KhachHang khachHang = null;
	private NhanVien nhanVien = null;
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	private JPanel contentPane;

	private DangNhap_GUI dangNhapGUI = new DangNhap_GUI();
	private DangKy_GUI dangKyGUI = new DangKy_GUI();

	private TrangChaoMung_GUI TrangChaoMungGUI = new TrangChaoMung_GUI();
	private HoaDon_GUI hoaDonGUI = new HoaDon_GUI();
	private TaoHoaDon_GUI taoHoaDonGUI;
	private TimKiemHoaDon_GUI timKiemHoaDonGUI = new TimKiemHoaDon_GUI();

	private Sach_GUI SachGUI = new Sach_GUI();

	private SanPhamKhac_GUI SanPhamKhacGUI = new SanPhamKhac_GUI();

	private LoaiSanPham_GUI LoaiSanPhamGUI = new LoaiSanPham_GUI();
	private TimKiemSach_GUI timKiemSachGUI = new TimKiemSach_GUI();
	private TimKiemSanPhamKhac_GUI timKiemSPKhacGUI = new TimKiemSanPhamKhac_GUI();
	private TimKiemDanhMucSanPham_GUI timKiemDMSPGUI = new TimKiemDanhMucSanPham_GUI();
	private ThongKeSachBanChay_GUI thongKeSPBCGUI = new ThongKeSachBanChay_GUI();
	private ThongKeDungCuBanChay_GUI thongKeDCBCGUI = new ThongKeDungCuBanChay_GUI();
	private ThongKeSachDaHet_GUI thongKeSPDBHGUI = new ThongKeSachDaHet_GUI();
	private ThongKeDungCuDaHet_GUI thongKeDCDBHGUI = new ThongKeDungCuDaHet_GUI();

	private KhachHang_GUI khachHangGUI = new KhachHang_GUI();
	private ThemKhachHang_GUI themKHGUI = new ThemKhachHang_GUI();
	private MuaHang muaHangGUI = new MuaHang();
	private DatHang_GUI datHangGUI;
	private ThemDonDatHang_GUI themDDHGUI = new ThemDonDatHang_GUI();
	private TimKiemKhachHang_GUI timKiemKHGUI = new TimKiemKhachHang_GUI();
	private ThongKeMucDoMuaHang_GUI thongKeKHTNGUI = new ThongKeMucDoMuaHang_GUI();
	private ThongKeKHMuaNhieuNhat thongKeKHMuaNhieuGUI = new ThongKeKHMuaNhieuNhat();
	private ThongKeKHMuaItNhat thongKeKHMuaItGUI = new ThongKeKHMuaItNhat();
	
	private NhaCungCap_GUI nhaCungCapGUI = new NhaCungCap_GUI();
	private TimKiemNCC_GUI timKiemNCCGUI = new TimKiemNCC_GUI();

	private NhanVien_GUI nhanVienGUI = new NhanVien_GUI();
	private TaoTaiKhoan_GUI taoTaiKhoanGUI = new TaoTaiKhoan_GUI();
	private TimKiemNhanVien_GUI timKiemNhanVienGUI = new TimKiemNhanVien_GUI();
//	private ThongKe_GUI thongKeGUI = new ThongKe_GUI();
	private ThongKe thongKeGUI = new ThongKe();

	private JMenuBar menuBar = new JMenuBar();
	private JMenu mnHoaDon = new JMenu();
	private JMenuItem mntmQLHoaDon = new JMenuItem();
	private JMenuItem mntmThemHoaDon = new JMenuItem();
	private JMenuItem mntmTimKiemHD = new JMenuItem();
	private JMenu mnKhachHang = new JMenu();
	private JMenuItem mntmQuanLyKH = new JMenuItem();
	private JMenuItem mntmThemKH = new JMenuItem();
	private JMenuItem mntmMuaHang = new JMenuItem();
	private JMenuItem mntmDonDatHang = new JMenuItem();
	private JMenuItem mntmTimKiemKH = new JMenuItem();
	private JMenuItem mntmThongKeKHTN = new JMenuItem();
	private JMenuItem mntmThongKeKHMuaNhieu = new JMenuItem();
	private JMenuItem mntmThongKeKHMuaIt = new JMenuItem();
	private JMenuItem mntmTaoTaiKhoan = new JMenuItem();
	private JMenuItem mntmQuanLyNhanVien = new JMenuItem();
	private JMenuItem mntmThongKe = new JMenuItem();
	private JMenuItem mntmQLSach = new JMenuItem();
	private JMenuItem mntmQLSPKhac = new JMenuItem();
	private JMenuItem mntmDanhMuc = new JMenuItem();
	private JMenuItem mntmNhaCC = new JMenuItem();
	private JMenuItem mntmThongKeSPBanChay = new JMenuItem();
	private JMenuItem mntmThongKeDCBanChay = new JMenuItem();
	private JMenuItem mntmThongKeSachBanHet = new JMenuItem();
	private JMenuItem mntmThongKeDCBanHet = new JMenuItem();
	private JMenu mnNhanVien = new JMenu();;
	private JMenuItem mntmTimKiemNV = new JMenuItem();
	private JMenuItem mntmThemDDH = new JMenuItem();

	/**
	 * Launch the application.
	 */
	public static void main(String[] args) {
		EventQueue.invokeLater(new Runnable() {
			public void run() {
				try {
					QuanLy_GUI frame = new QuanLy_GUI();
					frame.setVisible(true);
				} catch (Exception e) {
					e.printStackTrace();
				}
			}
		});
	}

	/**
	 * Create the frame.
	 * 
	 * @throws SQLException
	 */
	public QuanLy_GUI() throws SQLException {

		setTitle("Qu???n l?? hi???u s??ch");
		setDefaultCloseOperation(JFrame.EXIT_ON_CLOSE);
		setVisible(true);
		setBounds(0, 0, 1350, 700);

		
		contentPane = dangNhapGUI.getContentPane();
		renderMain(dangNhapGUI.getContentPane(), "dangnhap");
		handleLogin();
		handleRegister();
		handleDangXuat();
		handleTrangMuaHang();
	}

	public void menuGUI() {
		menuBar = new JMenuBar();

		this.setJMenuBar(menuBar);
		menuBar.setVisible(false);

		JMenu mnTrangChu = new JMenu("Trang ch\u1EE7");
		menuBar.add(mnTrangChu);
		
		if(nhanVien != null && nhanVien.getChucNang() != 2) {
			mnHoaDon = new JMenu("H??a ????n");
			menuBar.add(mnHoaDon);
	
			mntmQLHoaDon = new JMenuItem("Qu???n l?? h??a ????n");
			mnHoaDon.add(mntmQLHoaDon);
	
			mntmThemHoaDon = new JMenuItem("Th??m h??a ????n");
			mnHoaDon.add(mntmThemHoaDon);
	
			mntmTimKiemHD = new JMenuItem("T??m ki???m h??a ????n");
			mnHoaDon.add(mntmTimKiemHD);
		}
		
		JMenu mnSanPham = new JMenu("S??ch");
		menuBar.add(mnSanPham);
		JMenu mnSanPhamKhac = new JMenu("S???n ph???m kh??c");
		menuBar.add(mnSanPhamKhac);
		
		if(nhanVien != null && nhanVien.getChucNang() != 1) {
			mntmQLSach = new JMenuItem("Qu???n l?? s??ch");
			mnSanPham.add(mntmQLSach);
	
			mntmQLSPKhac = new JMenuItem("Qu???n l?? d???ng c??? h???c t???p");
			mnSanPhamKhac.add(mntmQLSPKhac);
	
			mntmDanhMuc = new JMenuItem("Qu???n l?? danh m???c s???n ph???m");
			mnSanPhamKhac.add(mntmDanhMuc);
	
			mntmNhaCC = new JMenuItem("Qu???n l?? nh?? cung c???p");
			mnSanPhamKhac.add(mntmNhaCC);
		}
		
		JMenuItem mntmTimKiemSach = new JMenuItem("T??m ki???m s??ch");
		mnSanPham.add(mntmTimKiemSach);

		JMenuItem mntmTimKiemSPKhac = new JMenuItem("T??m ki???m d???ng c??? h???c t???p");
		mnSanPhamKhac.add(mntmTimKiemSPKhac);

		JMenuItem mntmTimKiemDMSP = new JMenuItem("T??m ki???m danh m???c s???n ph???m");
		mnSanPhamKhac.add(mntmTimKiemDMSP);

		JMenuItem mntmTimKiemNCC = new JMenuItem("T??m ki???m nh?? cung c???p");
		mnSanPhamKhac.add(mntmTimKiemNCC);

		
		
		if(nhanVien != null && nhanVien.getChucNang() != 1) {
			mntmThongKeSPBanChay = new JMenuItem("Th???ng k?? s??ch b??n ch???y");
			mnSanPham.add(mntmThongKeSPBanChay);
	
			mntmThongKeDCBanChay = new JMenuItem("Th???ng k?? d???ng c??? b??n ch???y");
			mnSanPhamKhac.add(mntmThongKeDCBanChay);
	
			mntmThongKeSachBanHet = new JMenuItem("Th???ng k?? s??ch ???? h???t");
			mnSanPham.add(mntmThongKeSachBanHet);
	
			mntmThongKeDCBanHet = new JMenuItem("Th???ng k?? d???ng c??? ???? h???t");
			mnSanPhamKhac.add(mntmThongKeDCBanHet);
		}

//		JMenu mnDanhMucSanPham = new JMenu("Danh m???c s???n ph???m");
//		menuBar.add(mnDanhMucSanPham);
		
		mnKhachHang = new JMenu("Kh??ch h??ng");
		menuBar.add(mnKhachHang);
		
		if(nhanVien != null && nhanVien.getChucNang() != 2) {
	
			mntmQuanLyKH = new JMenuItem("Qu???n l?? kh??ch h??ng");
			mnKhachHang.add(mntmQuanLyKH);
	
			mntmThemKH = new JMenuItem("Th??m kh??ch h??ng");
			mnKhachHang.add(mntmThemKH);
			
		}
		
		
		mntmMuaHang = new JMenuItem("Mua h??ng");
		mnKhachHang.add(mntmMuaHang);
		
		if(nhanVien != null && nhanVien.getChucNang() != 2) {
			mntmDonDatHang = new JMenuItem("????n ?????t h??ng");
			mnKhachHang.add(mntmDonDatHang);
			
			mntmThemDDH = new JMenuItem("Th??m ????n ?????t h??ng");
			mnKhachHang.add(mntmThemDDH);
	
			mntmTimKiemKH = new JMenuItem("T??m ki???m kh??ch h??ng");
			mnKhachHang.add(mntmTimKiemKH);
			
			if(nhanVien.getChucNang() == 3) {
				mntmThongKeKHTN = new JMenuItem("Th???ng k?? m???c ????? mua h??ng");
				mnKhachHang.add(mntmThongKeKHTN);
		
				mntmThongKeKHMuaNhieu = new JMenuItem("Th???ng k?? kh??ch h??ng mua nhi???u nh???t");
				mnKhachHang.add(mntmThongKeKHMuaNhieu);
		
				mntmThongKeKHMuaIt = new JMenuItem("Th???ng k?? kh??ch h??ng mua ??t nh???t");
				mnKhachHang.add(mntmThongKeKHMuaIt);
			}
		}
		
		if(nhanVien != null) {
			mnNhanVien = new JMenu("Nh??n vi??n");
			menuBar.add(mnNhanVien);
		
			if(nhanVien != null && nhanVien.getChucNang() == 3) {
				mntmQuanLyNhanVien = new JMenuItem("Qu???n l?? nh??n vi??n");
				mnNhanVien.add(mntmQuanLyNhanVien);
			}
	
	
			if(nhanVien != null && nhanVien.getChucNang() == 3) {
				mntmTaoTaiKhoan = new JMenuItem("Th??m nh??n vi??n");
				mnNhanVien.add(mntmTaoTaiKhoan);
			}
	
			mntmTimKiemNV = new JMenuItem("T??m ki???m nh??n vi??n");
			mnNhanVien.add(mntmTimKiemNV);
	
			
			if(nhanVien != null && nhanVien.getChucNang() == 3) {
				mntmThongKe = new JMenuItem("Th???ng k?? doanh thu");
				mnNhanVien.add(mntmThongKe);
			}
		}
		mnTrangChu.addMenuListener(new MenuListener() {

			@Override
			public void menuSelected(MenuEvent e) {
				// TODO Auto-generated method stub
				renderMain(TrangChaoMungGUI.getContentPane(), "chaomung");
			}

			@Override
			public void menuDeselected(MenuEvent e) {
			}

			@Override
			public void menuCanceled(MenuEvent e) {
			}
		});

		mntmQLHoaDon.addActionListener(new ActionListener() {

			@Override
			public void actionPerformed(ActionEvent e) {
				// TODO Auto-generated method stub
				renderMain(hoaDonGUI.getContentPane(), "hoadon");
				try {
					hoaDonGUI.renderData();
				} catch (SQLException e1) {
					// TODO Auto-generated catch block
					e1.printStackTrace();
				}
			}
		});

		mntmThemHoaDon.addActionListener(new ActionListener() {

			@Override
			public void actionPerformed(ActionEvent e) {
				// TODO Auto-generated method stub
				renderMain(taoHoaDonGUI.getContentPane(), "taohoadon");
				try {
					taoHoaDonGUI.renderData();
					taoHoaDonGUI.renderKhachHang();
				} catch (SQLException e1) {
					// TODO Auto-generated catch block
					e1.printStackTrace();
				}

			}
		});

		mntmTimKiemHD.addActionListener(new ActionListener() {

			@Override
			public void actionPerformed(ActionEvent e) {
				renderMain((JPanel) timKiemHoaDonGUI.getContentPane(), "timkiemhoadon");
				try {
					timKiemHoaDonGUI.renderData();
				} catch (SQLException e1) {
					// TODO Auto-generated catch block
					e1.printStackTrace();
				}
			}
		});

		mntmQLSach.addActionListener(new ActionListener() {

			@Override
			public void actionPerformed(ActionEvent e) {
				renderMain((JPanel) SachGUI.getContentPane(), "sanpham");
				try {
					SachGUI.renderData();
				} catch (SQLException e1) {
					// TODO Auto-generated catch block
					e1.printStackTrace();
				}
			}
		});

		mntmQLSPKhac.addActionListener(new ActionListener() {

			@Override
			public void actionPerformed(ActionEvent e) {
				// TODO Auto-generated method stub
				renderMain((JPanel) SanPhamKhacGUI.getContentPane(), "sanphamkhac");
				try {
					SanPhamKhacGUI.renderData();
				} catch (SQLException e1) {
					// TODO Auto-generated catch block
					e1.printStackTrace();
				}

			}
		});

		mntmDanhMuc.addActionListener(new ActionListener() {

			@Override
			public void actionPerformed(ActionEvent e) {
				renderMain((JPanel) LoaiSanPhamGUI.getContentPane(), "danhmucsanpham");
				try {
					LoaiSanPhamGUI.renderData();
				} catch (SQLException e1) {
					// TODO Auto-generated catch block
					e1.printStackTrace();
				}
			}
		});

		mntmNhaCC.addActionListener(new ActionListener() {

			@Override
			public void actionPerformed(ActionEvent e) {
				renderMain((JPanel) nhaCungCapGUI.getContentPane(), "nhacungcap");
				try {
					nhaCungCapGUI.renderData();
				} catch (SQLException e1) {
					// TODO Auto-generated catch block
					e1.printStackTrace();
				}
			}
		});

		mntmTimKiemSach.addActionListener(new ActionListener() {
			@Override
			public void actionPerformed(ActionEvent e) {
				// TODO Auto-generated method stub
				renderMain((JPanel) timKiemSachGUI.getContentPane(), "timkiemsach");
				try {
					timKiemSachGUI.renderData();
				} catch (SQLException e1) {
					// TODO Auto-generated catch block
					e1.printStackTrace();
				}
			}
		});

		mntmTimKiemSPKhac.addActionListener(new ActionListener() {

			@Override
			public void actionPerformed(ActionEvent e) {

				// TODO Auto-generated method stub

				renderMain((JPanel) timKiemSPKhacGUI.getContentPane(), "timkiemspkhac");
				try {
					timKiemSPKhacGUI.renderData();
				} catch (SQLException e1) {
					// TODO Auto-generated catch block
					e1.printStackTrace();
				}
			}
		});

		mntmTimKiemDMSP.addActionListener(new ActionListener() {

			@Override
			public void actionPerformed(ActionEvent e) {
				// TODO Auto-generated method stub

				renderMain((JPanel) timKiemDMSPGUI.getContentPane(), "timkiemdanhmucsanpham");
				try {
					timKiemDMSPGUI.renderData();
				} catch (SQLException e1) {
					// TODO Auto-generated catch block
					e1.printStackTrace();
				}
			}
		});
		
		mntmTimKiemNCC.addActionListener(new ActionListener() {

			@Override
			public void actionPerformed(ActionEvent e) {
				// TODO Auto-generated method stub

				renderMain((JPanel) timKiemNCCGUI.getContentPane(), "timkiemnhacungcap");
				try {
					timKiemNCCGUI.renderData();
				} catch (SQLException e1) {
					// TODO Auto-generated catch block
					e1.printStackTrace();
				}
			}
		});

		mntmThongKeSPBanChay.addActionListener(new ActionListener() {

			@Override
			public void actionPerformed(ActionEvent e) {

				renderMain(thongKeSPBCGUI.getContentPane(), "thongkespbc");
				try {
					thongKeSPBCGUI.renderData();
				} catch (SQLException e1) {
					// TODO Auto-generated catch block
					e1.printStackTrace();
				}
			}
		});

		mntmThongKeDCBanChay.addActionListener(new ActionListener() {
			@Override
			public void actionPerformed(ActionEvent e) {

				renderMain(thongKeDCBCGUI.getContentPane(), "thongkedcbc");
				try {
					thongKeDCBCGUI.renderData();
				} catch (SQLException e1) {
					// TODO Auto-generated catch block
					e1.printStackTrace();
				}
			}
		});

		mntmThongKeSachBanHet.addActionListener(new ActionListener() {

			@Override
			public void actionPerformed(ActionEvent e) {
				renderMain(thongKeSPDBHGUI.getContentPane(), "thongkespdbh");
				try {
					thongKeSPDBHGUI.renderData();
				} catch (SQLException e1) {
					// TODO Auto-generated catch block
					e1.printStackTrace();
				}
			}
		});

		mntmThongKeDCBanHet.addActionListener(new ActionListener() {

			@Override
			public void actionPerformed(ActionEvent e) {
				renderMain(thongKeDCDBHGUI.getContentPane(), "thongkedcdbh");
				try {
					thongKeDCDBHGUI.renderData();
				} catch (SQLException e1) {
					// TODO Auto-generated catch block
					e1.printStackTrace();
				}
			}
		});

		mntmQuanLyKH.addActionListener(new ActionListener() {

			@Override
			public void actionPerformed(ActionEvent e) {
				renderMain(khachHangGUI.getContentPane(), "khachhang");
				
			}
		});

		mntmThemKH.addActionListener(new ActionListener() {

			@Override
			public void actionPerformed(ActionEvent e) {
				themKHGUI.setVisible(true);
				themKHGUI.setLocationRelativeTo(contentPane);
			}
		});
		
		mntmMuaHang.addActionListener(new ActionListener() {

			@Override
			public void actionPerformed(ActionEvent e) {
				muaHangGUI.setVisible(true);
				muaHangGUI.setLocationRelativeTo(contentPane);
			}
		});

		mntmDonDatHang.addActionListener(new ActionListener() {

			@Override
			public void actionPerformed(ActionEvent e) {
				renderMain(datHangGUI.getContentPane(), "dondathang");
				try {
					datHangGUI.renderData();
				} catch (SQLException e1) {
					// TODO Auto-generated catch block
					e1.printStackTrace();
				}
			}
		});
		
		mntmThemDDH.addActionListener(new ActionListener() {

			@Override
			public void actionPerformed(ActionEvent e) {
				renderMain(themDDHGUI.getContentPane(), "them dondathang");
				try {
					themDDHGUI.renderData();
				} catch (SQLException e1) {
					// TODO Auto-generated catch block
					e1.printStackTrace();
				}
			}
		});

		mntmTimKiemKH.addActionListener(new ActionListener() {

			@Override
			public void actionPerformed(ActionEvent e) {
				renderMain((JPanel) timKiemKHGUI.getContentPane(), "dondathang");
			}
		});

		mntmThongKeKHTN.addActionListener(new ActionListener() {

			@Override
			public void actionPerformed(ActionEvent e) {

				renderMain(thongKeKHTNGUI.getContentPane(), "thongkekhtn");
				try {
					thongKeKHTNGUI.renderData();
				} catch (SQLException e1) {
					// TODO Auto-generated catch block
					e1.printStackTrace();
				}
			}
		});

		mntmThongKeKHMuaNhieu.addActionListener(new ActionListener() {

			@Override
			public void actionPerformed(ActionEvent e) {

				renderMain(thongKeKHMuaNhieuGUI.getContentPane(), "thongkekhmuanhieu");
				try {
					thongKeKHMuaNhieuGUI.renderData();
				} catch (SQLException e1) {
					// TODO Auto-generated catch block
					e1.printStackTrace();
				}
			}
		});

		mntmThongKeKHMuaIt.addActionListener(new ActionListener() {

			@Override
			public void actionPerformed(ActionEvent e) {

				renderMain(thongKeKHMuaItGUI.getContentPane(), "thongkekhmuait");
				try {
					thongKeKHMuaItGUI.renderData();
				} catch (SQLException e1) {
					// TODO Auto-generated catch block
					e1.printStackTrace();
				}
			}
		});

		mntmQuanLyNhanVien.addActionListener(new ActionListener() {

			@Override
			public void actionPerformed(ActionEvent e) {
				renderMain(nhanVienGUI.getContentPane(), "nhanvien");

			}
		});

		mntmThongKe.addActionListener(new ActionListener() {

			@Override
			public void actionPerformed(ActionEvent e) {
				renderMain(thongKeGUI.getContentPane(), "thongke");
				try {
					thongKeGUI.renderData();
				} catch (SQLException e1) {
					// TODO Auto-generated catch block
					e1.printStackTrace();
				}
			}
		});

		mntmTimKiemNV.addActionListener(new ActionListener() {

			@Override
			public void actionPerformed(ActionEvent e) {
				renderMain((JPanel) timKiemNhanVienGUI.getContentPane(), "timkiemnhanvien");
			}
		});

		mntmTaoTaiKhoan.addActionListener(new ActionListener() {

			@Override
			public void actionPerformed(ActionEvent e) {

				taoTaiKhoanGUI.setVisible(true);
				taoTaiKhoanGUI.setLocationRelativeTo(contentPane);
			}
		});

	}

	public void renderMain(JPanel contentPane, String tab) {
		this.remove(this.contentPane);
		this.revalidate();
		this.repaint();
		this.contentPane = contentPane;
		this.setContentPane(contentPane);
		this.revalidate();
		this.repaint();

		//System.out.println("-> " + tab);
		if (tab.equals("thongke")) {

		}

	}

	public void handleLogin() {
		dangNhapGUI.btnDangNhap.addActionListener(new ActionListener() {
			public void actionPerformed(ActionEvent e) {
				try {
					if (dangNhapGUI.checkPassword()) {
						
						TaiKhoan taiKhoan = new TaiKhoanDAO().getTaiKhoan(dangNhapGUI.getTxtUserName().getText());
						khachHang = new KhachHangDAO().getKhachHangByMaTK(taiKhoan.getId());
//						//System.out.println(khachHang);
						
						if(dangNhapGUI.chkIsNhanVien.isSelected()) {
							nhanVien = new NhanVienDAO().getNhanVienByMaTK(taiKhoan.getId());
							
							if(nhanVien == null) {
								JOptionPane.showMessageDialog(contentPane, "B???n kh??ng ph???i nh??n vi??n vui l??ng ????ng nh???p l???i");
								return;
							}
						}
						muaHangGUI.setKhachHang(khachHang);
//						muaHangGUI.setPrimary(false);
//						muaHangGUI.trangChuGUI.renderData();
//						muaHangGUI.gioHangGUI.renderData();
//						muaHangGUI.getContentPane().revalidate();
//						muaHangGUI.getContentPane().repaint();
						
//						if (nhanVien != null) {
							taoHoaDonGUI = new TaoHoaDon_GUI(nhanVien);
							datHangGUI = new DatHang_GUI(nhanVien);
							renderMain(TrangChaoMungGUI.getContentPane(), "chao mung");
							menuGUI();
							menuBar.setVisible(true);
							menuBar.revalidate();
							menuBar.repaint();
//						}else {
//							muaHangGUI.setPrimary(true);
//							muaHangGUI.setVisible(true);
//							setVisible(false);
//						}
						dangNhapGUI.clear();
						//System.out.println("dang nhap thanh cong");
					} else {
						//System.out.println("sai mat khau");
					}
				} catch (SQLException e1) {
					// TODO Auto-generated catch block
					e1.printStackTrace();
				}
			}
		});

		dangNhapGUI.btnDangKy.addActionListener(new ActionListener() {
			public void actionPerformed(ActionEvent e) {
				// //System.out.println("hi");
				renderMain(dangKyGUI.getContentPane(), "dangky");
			}
		});
		
		dangNhapGUI.btnThoat.addActionListener((e) -> {
			System.exit(0);
		});
	}

	public void handleRegister() {
		dangKyGUI.btnDangNhap.addActionListener(new ActionListener() {
			public void actionPerformed(ActionEvent e) {

				renderMain(dangNhapGUI.getContentPane(), "login");
			}
		});

		dangKyGUI.btnDangKy.addActionListener(new ActionListener() {
			public void actionPerformed(ActionEvent e) {
				try {
					if (dangKyGUI.dangKy()) {
						renderMain(dangNhapGUI.getContentPane(), "login");
					}
				} catch (SQLException e1) {
					// TODO Auto-generated catch block
					e1.printStackTrace();
				}
			}
		});
	}
	
	public void handleDangXuat() {
		TrangChaoMungGUI.btnDangXuat.addActionListener((e) -> {
			this.khachHang = null;
			this.nhanVien = null;
			dangXuat();
			renderMain(dangNhapGUI.getContentPane(), "login");
		});
	}
	
	public void handleTrangMuaHang() {
		muaHangGUI.trangChuGUI.mntmDangXuat.addActionListener((e) -> {
			//System.out.println("dang xuat");
			this.khachHang = null;
			this.nhanVien = null;
			muaHangGUI.setKhachHang(null);
			dangXuat();
			renderMain(dangNhapGUI.getContentPane(), "login");
			setVisible(true);
			muaHangGUI.setVisible(false);
		});
		muaHangGUI.gioHangGUI.mntmDangXuat.addActionListener((e) -> {
			//System.out.println("dang xuat");
			this.khachHang = null;
			this.nhanVien = null;
			muaHangGUI.setKhachHang(null);
			dangXuat();
			renderMain(dangNhapGUI.getContentPane(), "login");
			setVisible(true);
			muaHangGUI.setVisible(false);
		});
	}
	
	public void dangXuat() {
		menuBar.setVisible(false);
//		menuBar.revalidate();
//		menuBar.repaint();
	}

	public JPanel getContentPane() {
		return this.contentPane;
	}
}
