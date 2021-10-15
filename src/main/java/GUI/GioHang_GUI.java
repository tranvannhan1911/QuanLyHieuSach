package GUI;

import java.awt.BorderLayout;
import java.awt.Dimension;
import java.awt.EventQueue;
import java.awt.Toolkit;
import java.awt.event.ActionEvent;
import java.awt.event.ActionListener;

import javax.swing.BoxLayout;
import javax.swing.ImageIcon;
import javax.swing.JFrame;
import javax.swing.JPanel;
import javax.swing.JScrollPane;
import javax.swing.border.EmptyBorder;
import java.awt.Component;
import javax.swing.Box;
import javax.swing.JLabel;
import javax.swing.JOptionPane;

import java.awt.Color;
import java.awt.Font;
import javax.swing.SwingConstants;
import java.awt.GridBagLayout;
import java.awt.GridBagConstraints;
import java.awt.Insets;
import java.awt.GridLayout;
import java.awt.FlowLayout;
import javax.swing.JTextField;
import javax.swing.JButton;

public class GioHang_GUI extends JFrame {

	private JPanel contentPane;
	private JTextField textField;
	private JTextField textField_1;
	private int numberOfItem = 5;

	/**
	 * Launch the application.
	 */
	public static void main(String[] args) {
		EventQueue.invokeLater(new Runnable() {
			public void run() {
				try {
					GioHang_GUI frame = new GioHang_GUI();
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
	public GioHang_GUI() {
		setTitle("Giỏ hàng");
		setResizable(false);
		setDefaultCloseOperation(JFrame.EXIT_ON_CLOSE);
		setLocationRelativeTo(null);
		setBounds(0, 0, 1300, 700);
		Dimension screenSize = Toolkit.getDefaultToolkit().getScreenSize();
		setSize(screenSize.width, screenSize.height);
		
		contentPane = new JPanel();
		contentPane.setBorder(new EmptyBorder(5, 5, 5, 5));
		contentPane.setLayout(new BorderLayout(0, 0));
		setContentPane(contentPane);
		
//		header
		contentPane.add(new TrangChu_GUI().headerGUI(), BorderLayout.NORTH);
		
//		content
		JPanel panelContent = new JPanel();
		
		panelContent.setLayout(new BoxLayout(panelContent, BoxLayout.X_AXIS));
		
		JScrollPane pane = new JScrollPane(panelContent);
		
		Component horizontalStrut = Box.createHorizontalStrut(200);
		panelContent.add(horizontalStrut);
		
		JPanel panel = new JPanel();
		panelContent.add(panel);
		panel.setLayout(new BorderLayout(0, 0));
		
		JLabel lblNewLabel = new JLabel("Giỏ hàng");
		lblNewLabel.setHorizontalAlignment(SwingConstants.CENTER);
		lblNewLabel.setFont(new Font("Tahoma", Font.PLAIN, 40));
		lblNewLabel.setForeground(new Color(0, 206, 209));
		panel.add(lblNewLabel, BorderLayout.NORTH);
		
		JPanel panel_1 = new JPanel();
		panel.add(panel_1, BorderLayout.CENTER);
		panel_1.setLayout(new BoxLayout(panel_1, BoxLayout.Y_AXIS));
		
		JPanel panel_2 = new JPanel();
		panel_2.setPreferredSize(new Dimension(10, -500 + numberOfItem*200));
		panel_1.add(panel_2);
		
		JPanel pnItems = new JPanel();
		panel_2.add(pnItems);
		pnItems.setLayout(new GridLayout(0, 1, 0, 5));
		
		pnItems.add(this.itemGUI());
		pnItems.add(this.itemGUI());
		pnItems.add(this.itemGUI());
		pnItems.add(this.itemGUI());
		pnItems.add(this.itemGUI());
		
		JPanel pnThongTin = new JPanel();
		panel_1.add(pnThongTin);
		pnThongTin.setLayout(new FlowLayout(FlowLayout.CENTER, 5, 5));
		
		JButton btnDatHang = new JButton("Đặt hàng");
		btnDatHang.setPreferredSize(new Dimension(150, 23));
		pnThongTin.add(btnDatHang);
		btnDatHang.addActionListener(new ActionListener() {
			
			public void actionPerformed(ActionEvent e) {
				JOptionPane.showConfirmDialog(null, "Xác nhận đặt hàng ?");
			}
		});
		
		Component horizontalStrut_1 = Box.createHorizontalStrut(200);
		panelContent.add(horizontalStrut_1);
		contentPane.add(pane);
	}
	
	public JPanel itemGUI() {
		JPanel pnItem = new JPanel();
		pnItem.setPreferredSize(new Dimension(700, 100));
		pnItem.setBackground(Color.WHITE);
		pnItem.setLayout(new GridLayout(0, 4, 0, 0));
		
		JPanel panel_2_1 = new JPanel();
		panel_2_1.setBackground(Color.WHITE);
		pnItem.add(panel_2_1);
		panel_2_1.setLayout(new FlowLayout(FlowLayout.CENTER, 5, 5));
		
		JLabel lbIcon = new JLabel();
		lbIcon.setAlignmentX(0.5f);
		panel_2_1.add(lbIcon);
		ImageIcon imageProduct = new ImageIcon("data/product/conan_tap_1.jpg");
		imageProduct = TrangChu_GUI.resizeIcon(imageProduct, new Dimension(150, 90));
		lbIcon.setIcon(imageProduct);
		
		JPanel panel_3 = new JPanel();
		panel_3.setBackground(Color.WHITE);
		pnItem.add(panel_3);
		panel_3.setLayout(new GridLayout(0, 1, 0, 0));
		
		JLabel lblNewLabel_1 = new JLabel("Conan - tập 1");
		lblNewLabel_1.setFont(new Font("Tahoma", Font.PLAIN, 20));
		lblNewLabel_1.setHorizontalAlignment(SwingConstants.LEFT);
		panel_3.add(lblNewLabel_1);
		
		JPanel pnDonGia = new JPanel();
		pnDonGia.setBackground(Color.WHITE);
		panel_3.add(pnDonGia);
		pnDonGia.setLayout(new BoxLayout(pnDonGia, BoxLayout.X_AXIS));
		
		JLabel lblDonGia = new JLabel("Đơn giá:    ");
		lblDonGia.setBackground(Color.WHITE);
		pnDonGia.add(lblDonGia);
		
		JLabel donGia = new JLabel("14.000đ");
//		lblTongTien.setForeground(new Color(0, 206, 209));
		donGia.setBackground(Color.WHITE);
		pnDonGia.add(donGia);
		
		JPanel panel_1_1 = new JPanel();
		panel_1_1.setBackground(Color.WHITE);
		panel_3.add(panel_1_1);
		panel_1_1.setLayout(new BoxLayout(panel_1_1, BoxLayout.X_AXIS));
		
		JLabel lblNewLabel_3 = new JLabel("Số lượng:  ");
		panel_1_1.add(lblNewLabel_3);
		
		textField = new JTextField();
		textField.setText("1");
		textField.setColumns(10);
		panel_1_1.add(textField);
		
		JPanel panel_4 = new JPanel();
		panel_4.setBackground(Color.WHITE);
		panel_3.add(panel_4);
		panel_4.setLayout(new BoxLayout(panel_4, BoxLayout.X_AXIS));
		
		JLabel lblNewLabel_4 = new JLabel("Tổng tiền:  ");
		lblNewLabel_4.setBackground(Color.WHITE);
		panel_4.add(lblNewLabel_4);
		
		JLabel lblTongTien = new JLabel("14.000đ");
		lblTongTien.setForeground(new Color(0, 206, 209));
		lblTongTien.setBackground(Color.WHITE);
		panel_4.add(lblTongTien);
		
		JPanel panel_5 = new JPanel();
		panel_5.setBackground(Color.WHITE);
		pnItem.add(panel_5);
		
		JPanel panel_6 = new JPanel();
		panel_6.setBackground(Color.WHITE);
		pnItem.add(panel_6);
		
		JButton btnNewButton = new JButton("Xóa");
		btnNewButton.setAlignmentY(Component.BOTTOM_ALIGNMENT);
		btnNewButton.setHorizontalAlignment(SwingConstants.RIGHT);
		panel_6.add(btnNewButton);
		
		return pnItem;
	}
}