package liketo;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import dbconn.DBConnect;

public class LiketoDaoImpl implements LiketoDao{
	DBConnect db;
	
	public LiketoDaoImpl() {
		db = DBConnect.getInstance();
	}

	@Override
	public ArrayList<Liketo> liketoSelectList() {
		ResultSet rs;
		Connection conn = db.getConnection();
		PreparedStatement pstmt;
		ArrayList<Liketo> list = new ArrayList<Liketo>();
		String sql = "select * from liketo";
		try {
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			while (rs.next()) {
				list.add(new Liketo(rs.getInt(1), rs.getInt(2), rs.getString(3), rs.getInt(4)));
			}
		}catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			db.disConn();
		}
		return list;
	}

	@Override
	public Liketo liketoSelect(int preps_num, String m_id) {
		ResultSet rs;
		Liketo pdr = null;
		
		Connection conn = db.getConnection();

		String sql = "select * from liketo where like_preps_num =? and like_m_id =?";
		PreparedStatement pstmt;
		try {
			pstmt = conn.prepareStatement(sql);

			pstmt.setInt(1, preps_num);
			pstmt.setString(2, m_id);
			rs = pstmt.executeQuery();
			
			if (rs.next()) {
				int preps_num1 = rs.getInt(1);
				int like_preps_num  = rs.getInt(2);
				String like_m_id  = rs.getString(3);
				int like_check  = rs.getInt(4);
				
				pdr = new Liketo(preps_num1, like_preps_num, like_m_id, like_check);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			db.disConn();
		}		
		return pdr;
	}

	@Override
	public void likeInsert(int preps_num, String m_id) {
		Connection conn = db.getConnection();
		String sql = "insert into liketo values(SEQ_LIKE_NUM.nextval, ?, ? ,1)";
		PreparedStatement pstmt;
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, preps_num);
			pstmt.setString(2, m_id);
			
			pstmt.executeUpdate();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			db.disConn();
		}
	}

	@Override
	public void likeUpdate(int preps_num, String m_id) {
		Connection conn = db.getConnection();
		String sql = "update liketo set like_check=1 where like_preps_num=? and like_m_id=?";
		PreparedStatement pstmt;
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, preps_num);
			pstmt.setString(2, m_id);
			
			pstmt.executeUpdate();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			db.disConn();
		}
	}

	@Override
	public void liketoSub(int preps_num, String m_id) {
		Connection conn = db.getConnection();
		String sql = "update liketo set like_check=0 where like_preps_num=? and like_m_id=?";
		PreparedStatement pstmt;
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, preps_num);
			pstmt.setString(2, m_id);
			
			pstmt.executeUpdate();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			db.disConn();
		}
	}
}
