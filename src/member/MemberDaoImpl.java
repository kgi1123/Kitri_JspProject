package member;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import dbconn.DBConnect;

public class MemberDaoImpl implements MemberDao {
	private DBConnect db;

	public MemberDaoImpl() {
		db = DBConnect.getInstance();
	}
	@Override
	public void insert(Member m) {
		Connection conn = db.getConnection();
		
		String sql = "insert into member values(?,?,?,?,?,?,?,?)";
		PreparedStatement pstmt;
		
		try {
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setString(1, m.getM_id());
			pstmt.setString(2, m.getM_pwd());
			pstmt.setString(3, m.getM_name());
			pstmt.setString(4, m.getM_phone());
			pstmt.setInt(5, m.getM_postNum());
			pstmt.setString(6, m.getM_address());
			pstmt.setString(7, m.getM_email());
			pstmt.setInt(8, m.getM_type());
			
			pstmt.executeQuery();
		} catch(SQLException e) {
			e.printStackTrace();
		} finally {
			db.disConn();
		}
	}

	@Override
	public Member select(String id) {
		ResultSet rs;
		Member m = null;
		
		Connection conn = db.getConnection();

		String sql = "select * from member where m_id=?";
		PreparedStatement pstmt;
		
		try {
			pstmt = conn.prepareStatement(sql);

			pstmt.setString(1, id);
			rs = pstmt.executeQuery();
			
			if (rs.next()) {
				String m_id = rs.getString(1);
				String m_pwd = rs.getString(2);
				String m_name = rs.getString(3);
				String m_phone = rs.getString(4);
				int m_postNum = rs.getInt(5);
				String m_address = rs.getString(6);
				String m_email = rs.getString(7);
				int m_type = rs.getInt(8);
				
				m = new Member(m_id, m_pwd, m_name, m_phone, m_postNum, m_address, m_email, m_type);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			db.disConn();
		}		
		return m;
	}
	@Override
	public void update(Member m) {
		Connection conn = db.getConnection();

		String sql = "update member set m_pwd=?, m_phone=?, m_postNum=?, m_address=?, m_email=? where m_id=?";
		PreparedStatement pstmt;
		try {
			pstmt = conn.prepareStatement(sql);

			pstmt.setString(1, m.getM_pwd());
			pstmt.setString(2, m.getM_phone());
			pstmt.setInt(3, m.getM_postNum());
			pstmt.setString(4, m.getM_address());
			pstmt.setString(5, m.getM_email());
			pstmt.setString(6, m.getM_id());	

			pstmt.executeUpdate();
			/*System.out.println("업데이트 확인");
			System.out.println("pwd:"+m.getM_pwd());
			System.out.println("phone:"+ m.getM_phone());
			System.out.println("addr:"+m.getM_address());
			System.out.println("email:"+ m.getM_email());
			System.out.println("id:"+m.getM_id());
			System.out.println("sql:"+sql);*/
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			db.disConn();
		}
	}

	@Override
	public void delete(String id) {
		// TODO Auto-generated method stub
		Connection conn = db.getConnection();
		String sql = "delete member where m_id=?";
		PreparedStatement pstmt;
		try {
			pstmt = conn.prepareStatement(sql);		
			pstmt.setString(1, id);
			pstmt.executeUpdate();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		db.disConn();
	}
	@Override
	public boolean check_id(String id) {
		// TODO Auto-generated method stub
		ResultSet rs;
		boolean result = false;
		Connection conn = db.getConnection();
		String sql = "select m_id from member where m_id=?";
		PreparedStatement pstmt;
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, id);
			rs = pstmt.executeQuery();
			if (rs.next()) {
				result = true;
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {//현재 메서드가 종료하기 전에 꼭 실행해야하는 코드 작성
			db.disConn();
		}
		return result;
	}
	@Override
	public String check_type(int m_type) {
		// TODO Auto-generated method stub
		ResultSet rs;
		Connection conn = db.getConnection();
		String sql = "select mtype_name from memberType where mtype_num=?";
		PreparedStatement pstmt;
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, m_type);
			rs = pstmt.executeQuery();
			if (rs.next()) {
				return rs.getString(1);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {//현재 메서드가 종료하기 전에 꼭 실행해야하는 코드 작성
			db.disConn();
		}
		return null;
	}

	@Override
	public ArrayList<Member> selectAll() {
		ResultSet rs;
		ArrayList<Member> list = new ArrayList<Member>();
		
		Connection conn = db.getConnection();

		String sql = "select * from member";
		PreparedStatement pstmt;
		try {
			pstmt = conn.prepareStatement(sql);

			rs = pstmt.executeQuery();
			
			while (rs.next()) {
				list.add(new Member(rs.getString(1), rs.getString(2),
				 rs.getString(3), rs.getString(4), rs.getInt(5), rs.getString(6), rs.getString(7), rs.getInt(8)));
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			db.disConn();
		}
		return list;
	}
	@Override
	public int get_type(String id) {
		// TODO Auto-generated method stub
		ResultSet rs;
		Connection conn = db.getConnection();

		String sql = "select m_type from member where m_id=?";
		PreparedStatement pstmt;
		
		try {
			pstmt = conn.prepareStatement(sql);

			pstmt.setString(1, id);
			rs = pstmt.executeQuery();
			
			if (rs.next()) {	
				int m_type = rs.getInt(1);
				return m_type;
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			db.disConn();
		}		
		return 0;
	}
	
}
