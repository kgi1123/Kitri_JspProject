package notice;

import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import dbconn.DBConnect;


public class NoticeDAOImpl implements NoticeDAO {
	private DBConnect db;
	
	public NoticeDAOImpl() {
		db = DBConnect.getInstance();
	}

	@Override
	public void insert(Notice n) {
		// TODO Auto-generated method stub
		// 1. 커넥션 수립
		Connection conn = db.getConnection();

		// 2. sql문 작성
		String sql = "insert into notice values(seq_notice_num.nextval,?,?,sysdate,?,?,?)";
		PreparedStatement pstmt;
		try {

			// 3. sql으로 PreparedStatement 객체 생성
			pstmt = conn.prepareStatement(sql);

			// 4. ?표 매칭. param1:?표순서/param2:그 위치에 들어갈 값
			pstmt.setString(1, n.getN_writer());
			pstmt.setString(2, n.getN_title());
			pstmt.setInt(3, n.getN_hits());
			pstmt.setString(4, n.getN_content());
			pstmt.setString(5, n.getN_img());

			// 5. 실행
			pstmt.executeUpdate();// insert, update, delete
			// pstmt.executeQuery() : select
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			db.disConn();
		}
		
	}

	@Override
	public Notice select(int num) {
		// TODO Auto-generated method stub
		ResultSet rs;
		// 1.커넥션 수립
		Connection conn = db.getConnection();
		
		// 2. sql문 작성
		String sql = "select * from notice where n_num=?";
		PreparedStatement pstmt;
		
		try {
			// 3. sql으로 PreparedStatment 객체 생성
			pstmt = conn.prepareStatement(sql);
			
			// 4. ?표 매칭. param1:?표 순서 / param2:그위치에 들어 갈 값
			pstmt.setInt(1, num);
			rs = pstmt.executeQuery(); 
			// ResultSet의 rs.next()는 다음줄로 이동
			// 처음 호출이면 첫번째 줄로 이동
			// ResultSet에서 더 이상 줄이 없으면 false 반환
			// 읽을 줄이 있으면 true 반환
			
			if(rs.next()) {
				int num1 = rs.getInt(1);
				String writer = rs.getString(2);
				String title = rs.getString(3);
				Date n_date = rs.getDate(4);
				int hits = rs.getInt(5);
				String content = rs.getString(6);
				String img = rs.getString(7);
				
				
				return new Notice(num1, writer, title, n_date, hits, content, img);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			db.disConn();
		}
		return null;
	}

	@Override
	public ArrayList<Notice> selectAll() {
		// TODO Auto-generated method stub
		ResultSet rs;
		ArrayList<Notice> list = new ArrayList<Notice>();

		// 1.커넥션 수립
		Connection conn = db.getConnection();
		// 2. sql문 작성
		String sql = "select * from notice order by n_num desc";
		PreparedStatement pstmt;
		
		try {
			// 3. sql으로 PreparedStatement 객체 생성
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				list.add(new Notice(rs.getInt(1), rs.getString(2),
						rs.getString(3), rs.getDate(4), 
						rs.getInt(5), rs.getString(6), rs.getString(7)));
			}
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		db.disConn();
		return list;
	}

	@Override
	public void update(Notice n) {
		// TODO Auto-generated method stub
		// 1. 커넥션 수립
		Connection conn = db.getConnection();
		
		// 2. sql문 작성
		String sql = "update notice set n_title=?, n_content=?, n_date=sysdate, n_img=? where n_num=?";
		PreparedStatement pstmt;
		try {
			// 3. sql로 PreparedStatment 객체 생성
			pstmt = conn.prepareStatement(sql);
			
			// 4. ?표 매칭 param1:?표 순서 / param2:그 위치에 들어갈 값
			pstmt.setString(1, n.getN_title());
			pstmt.setString(2, n.getN_content());
			pstmt.setString(3, n.getN_img());
			pstmt.setInt(4, n.getN_num());
			
			// 5. 실행
			pstmt.executeUpdate(); //insert, update, delete
			// pstmt.executeQuery() : select
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			db.disConn();
		}
		
	}

	@Override
	public void delete(int num) {
		// TODO Auto-generated method stub
		// 1. 커넥션 수립
		Connection conn = db.getConnection();
		
		// 2.sql문 작성
		String sql = "delete notice where n_num=?";
		PreparedStatement pstmt;
		
		try {
			// 3. sql으로 PreparedStatment 객체 생성
			pstmt = conn.prepareStatement(sql);
			
			// 4. ?표 매칭. param1:?표 순서 / param2:그 위치에 들어갈 값
			pstmt.setInt(1, num);
			
			// 5. 실행
			pstmt.executeUpdate(); // insert, update, delete
			// pstmt.executeQuery() : select
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			db.disConn();
		}
			
	}

	@Override
	public int countUseImg(String img, int num) {
		// TODO Auto-generated method stub
		ResultSet rs;
		// 1.커넥션 수립
		Connection conn = db.getConnection();
		
		// 2. sql문 작성
		String sql = "select count(*) from notice where num!=? and n_img=?";
		PreparedStatement pstmt;
		
		try {
			// 3. sql으로 PreparedStatment 객체 생성
			pstmt = conn.prepareStatement(sql);
			
			// 4. ?표 매칭. param1:?표 순서 / param2:그위치에 들어 갈 값
			pstmt.setInt(1, num);
			pstmt.setString(2, img);
			rs = pstmt.executeQuery(); 
			// ResultSet의 rs.next()는 다음줄로 이동
			// 처음 호출이면 첫번째 줄로 이동
			// ResultSet에서 더 이상 줄이 없으면 false 반환
			// 읽을 줄이 있으면 true 반환
			
			if(rs.next()) {
				return rs.getInt(1);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			db.disConn();
		}
		
		return 0;
	}

	@Override
	public void updateHits(int num) {
		// TODO Auto-generated method stub
		// 1. 커넥션 수립
		Connection conn = db.getConnection();
		
		// 2. sql문 작성
		String sql = "update notice set n_hits=n_hits+1 where n_num=?";
		PreparedStatement pstmt;
		try {
			// 3. sql로 PreparedStatment 객체 생성
			pstmt = conn.prepareStatement(sql);
			
			// 4. ?표 매칭 param1:?표 순서 / param2:그 위치에 들어갈 값
			pstmt.setInt(1, num);
			
			// 5. 실행
			pstmt.executeUpdate(); //insert, update, delete
			// pstmt.executeQuery() : select
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			db.disConn();
		}
	}

}
