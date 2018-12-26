package productReps;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

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
}
