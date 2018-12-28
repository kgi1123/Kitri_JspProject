package myOrder;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import dbconn.DBConnect;

public class MyOrderDaoImpl implements MyOrderDao{
	private DBConnect db;
	public MyOrderDaoImpl() {
		db = DBConnect.getInstance();
	}
	
	
	@Override
	public void insert(MyOrder mo) {
		Connection conn = db.getConnection();
		
		String sql = "insert into my_order values(seq_o_num.nextval, sysdate, ?, (select m_phone from member where m_id=?), "
				+ "(select m_name from member where m_id=?), ?, ?, ?, ?, default, ?, ?, ?, ?)";
		PreparedStatement pstmt;
		
		try {
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setString(1, mo.getO_buyer());
			pstmt.setString(2, mo.getO_buyer());
			pstmt.setString(3, mo.getO_buyer());
			pstmt.setString(4, mo.getO_recipient());
			pstmt.setString(5, mo.getO_address());
			pstmt.setString(6, mo.getO_goods());
			pstmt.setString(7, mo.getO_req());
			pstmt.setInt(8, mo.getO_qty());
			pstmt.setInt(9, mo.getO_p_num());
			pstmt.setInt(10, mo.getO_postnum());
			pstmt.setString(11, mo.getO_seller());
			
			pstmt.executeQuery();
		} catch(SQLException e) {
			e.printStackTrace();
		} finally {
			db.disConn();
		}
	}


	@Override
	public ArrayList<MyOrder> selectByO_buyer(String o_buyer) {
		ResultSet rs;
		ArrayList<MyOrder> list = new ArrayList<MyOrder>();		
		Connection conn = db.getConnection();
		
		String sql = "select p.p_img1, mo.o_goods, mo.o_seller, mo.o_pay, mo.o_date, mo.o_p_num "
				+ "from product p join my_order mo on mo.o_p_num = p.p_num "
				+ "where mo.o_buyer = ?";
		
		PreparedStatement pstmt;
		
		try {
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setString(1, o_buyer);
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				list.add(new MyOrder(rs.getString(1), rs.getString(2), rs.getString(3),
						rs.getString(4), rs.getDate(5), rs.getInt(6)));
			}
		} catch(SQLException e) {
			e.printStackTrace();
		} finally {
			db.disConn();
		}
		
		return list;
	}
	
}








