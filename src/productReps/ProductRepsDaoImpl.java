package productReps;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import dbconn.DBConnect;

public class ProductRepsDaoImpl implements ProductRepsDao{
	private DBConnect db;
	
	public ProductRepsDaoImpl() {
		db = DBConnect.getInstance();
	}

	@Override
	public void addProductReps(ProductReps pdr) {
		Connection conn = db.getConnection();
		String sql = "insert into productReps values(seq_preps_num.nextval,?,?,0,?,?,?)";
		
		PreparedStatement pstmt;
		
		try {
			pstmt = conn.prepareStatement(sql);

			pstmt.setInt(1, pdr.getPreps_p_num());
			pstmt.setString(2, pdr.getPreps_writer());
			pstmt.setInt(3, pdr.getPreps_star());
			pstmt.setString(4, pdr.getPreps_img());
			pstmt.setString(5, pdr.getPreps_content());

			pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			db.disConn();
		}
	}

	@Override
	public ProductReps selectReps(int product_num, String p_writer) {
		ResultSet rs;
		ProductReps pdr = null;
		
		Connection conn = db.getConnection();

		String sql = "select * from productreps where preps_p_num=? and preps_writer=?";
		PreparedStatement pstmt;
		try {
			pstmt = conn.prepareStatement(sql);

			pstmt.setInt(1, product_num);
			pstmt.setString(2, p_writer);
			rs = pstmt.executeQuery();
			
			if (rs.next()) {
				int preps_num = rs.getInt(1);
				int preps_p_num = rs.getInt(2);
				String preps_writer = rs.getString(3);
				int preps_rec = rs.getInt(4);
				int preps_star = rs.getInt(5);
				String preps_img = rs.getString(6);
				String preps_content = rs.getString(7);
				
				pdr = new ProductReps(preps_num, preps_p_num, preps_writer, preps_rec, preps_star, preps_img, preps_content);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			db.disConn();
		}		
		return pdr;
	}

	@Override
	public void updatePdr(ProductReps pdr) {
		Connection conn = db.getConnection();
		String sql = "update productReps set preps_star=?, preps_img=?, preps_content=? where preps_p_num=? and preps_writer=?";
		 
		PreparedStatement pstmt;
		
		try {
			pstmt = conn.prepareStatement(sql);

			pstmt.setInt(1, pdr.getPreps_star());
			pstmt.setString(2, pdr.getPreps_img ());
			pstmt.setString(3, pdr.getPreps_content ());
			pstmt.setInt(4, pdr.getPreps_p_num ());
			pstmt.setString(5, pdr.getPreps_writer ());

			pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			db.disConn();
		}
	}

	@Override
	public void deleteReps(int num, String writer) {
		Connection conn = db.getConnection();
		String sql = "delete from productReps where preps_p_num=? and preps_writer=?"; 
		
		PreparedStatement pstmt;
		
		try {
			pstmt = conn.prepareStatement(sql);

			pstmt.setInt(1, num);
			pstmt.setString(2, writer);

			pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			db.disConn();
		}
	}

	@Override
	public int prepsRecSelect(int p_num) {
		ResultSet rs;
		ProductReps pdr = null;
		
		Connection conn = db.getConnection();

		String sql = "select * from productreps where preps_num=?";
		PreparedStatement pstmt;
		int prepsRec = 0;
		
		try {
			pstmt = conn.prepareStatement(sql);

			pstmt.setInt(1, p_num);
			rs = pstmt.executeQuery();
			
			if (rs.next()) {
				prepsRec = rs.getInt(4);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			db.disConn();
		}		
		return prepsRec;
	}

	@Override
	public void prepsRecAdd(int preps_num, int preps_rec) {
		Connection conn = db.getConnection();
		String sql = "update productreps set preps_rec=? where preps_num=?"; 
		
		PreparedStatement pstmt;
		
		try {
			pstmt = conn.prepareStatement(sql);

			pstmt.setInt(1, preps_rec);
			pstmt.setInt(2, preps_num);

			pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			db.disConn();
		}
	}
	
	@Override
	public ArrayList<ProductReps> pdrListSelect(int num) {
		Connection conn = db.getConnection();
		ResultSet rs;
		ArrayList<ProductReps> list = new ArrayList<ProductReps>();
		String sql = "select * from ProductReps where preps_p_num=? order by preps_num desc";
		PreparedStatement pstmt;
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, num);
			rs = pstmt.executeQuery();
			while (rs.next()) {
				list.add(new ProductReps(rs.getInt(1), rs.getInt(2), rs.getString(3), rs.getInt(4), rs.getInt(5), rs.getString(6), rs.getString(7)));
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			db.disConn();
		}
		return list;
	}
}
