package GUI;

import java.awt.BorderLayout;
import java.awt.EventQueue;
import java.awt.event.ActionEvent;
import java.awt.event.ActionListener;

import javax.swing.JFrame;
import javax.swing.JPanel;
import javax.swing.border.EmptyBorder;
import javax.swing.event.MenuEvent;
import javax.swing.event.MenuListener;
import javax.swing.JMenuBar;
import javax.swing.JMenu;
import javax.swing.JMenuItem;

public class QuanLy_GUI extends JFrame {

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	private JPanel contentPane;
	
	private ThongKe_GUI thongKeGUI = new ThongKe_GUI();
	private SanPham_GUI sanPhamGUI = new SanPham_GUI();
	private HoaDon_GUI hoaDonGUI = new HoaDon_GUI();
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
	 */
	public QuanLy_GUI() {
//		setDefaultCloseOperation(JFrame.EXIT_ON_CLOSE);
		setBounds(0, 0, 1350, 700);
		
		JMenuBar menuBar = new JMenuBar();
		setJMenuBar(menuBar);
		
		JMenu mnNewMenu = new JMenu("Trang ch\u1EE7");
		menuBar.add(mnNewMenu);
		
		JMenu mnNewMenu_1 = new JMenu("Qu\u1EA3n l\u00FD h\u00F3a \u0111\u01A1n");
		menuBar.add(mnNewMenu_1);
		
		JMenu mnNewMenu_2 = new JMenu("Qu\u1EA3n l\u00FD s\u1EA3n ph\u1EA9m");
		menuBar.add(mnNewMenu_2);
		
		JMenu mnNewMenu_3 = new JMenu("Qu\u1EA3n l\u00FD kh\u00E1ch h\u00E0ng");
		menuBar.add(mnNewMenu_3);
		
		JMenu mnNewMenu_4 = new JMenu("Qu\u1EA3n l\u00FD nh\u00E2n vi\u00EAn");
		menuBar.add(mnNewMenu_4);
		
		JMenuItem mntmNewMenuItem_1 = new JMenuItem("Qu\u1EA3n l\u00FD nh\u00E2n vi\u00EAn");
		mnNewMenu_4.add(mntmNewMenuItem_1);
		
		JMenuItem mntmNewMenuItem = new JMenuItem("T\u1EA1o t\u00E0i kho\u1EA3n m\u1EDBi");
		mnNewMenu_4.add(mntmNewMenuItem);
		
		mnNewMenu.addMenuListener(new MenuListener() {
			
			@Override
			public void menuSelected(MenuEvent e) {
				// TODO Auto-generated method stub
				renderMain(thongKeGUI.getContentPane(), "thongke");
			}
			
			@Override
			public void menuDeselected(MenuEvent e) {}
			
			@Override
			public void menuCanceled(MenuEvent e) {}
		});
		
		
		mnNewMenu_1.addMenuListener(new MenuListener() {
			
			@Override
			public void menuSelected(MenuEvent e) {
				// TODO Auto-generated method stub
				renderMain(hoaDonGUI.getContentPane(), "hoadon");
			}
			
			@Override
			public void menuDeselected(MenuEvent e) {}
			
			@Override
			public void menuCanceled(MenuEvent e) {}
		});
		
		mnNewMenu_2.addMenuListener(new MenuListener() {
			
			@Override
			public void menuSelected(MenuEvent e) {
				// TODO Auto-generated method stub
				renderMain(sanPhamGUI.getContentPane(), "sanpham");
			}
			
			@Override
			public void menuDeselected(MenuEvent e) {}
			
			@Override
			public void menuCanceled(MenuEvent e) {}
		});
		
		contentPane = thongKeGUI.getContentPane();
//		contentPane.setBorder(new EmptyBorder(5, 5, 5, 5));
//		contentPane.setLayout(new BorderLayout(0, 0));
		renderMain(contentPane, "thongke");
		
	}
	
	public void renderMain(JPanel contentPane, String tab) {
		this.remove(this.contentPane);
        this.revalidate();
        this.repaint();
        this.contentPane = contentPane;
        this.setContentPane(contentPane);
        this.revalidate();
        this.repaint();
        
        System.out.println("-> "+tab);
		if(tab.equals("thongke")) {
			
		}
		
	}
	
	public JPanel getContentPane() {
		return this.contentPane;
	}
}
