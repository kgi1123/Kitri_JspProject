package product;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import dbconn.DBConnect;

public class ProductDaoImpl implements ProductDao{
	private DBConnect db;
	private Connection conn;
	
	public ProductDaoImpl() {db = DBConnect.getInstance();}
	
	@Override
	public void insert(Product p) {
		conn = db.getConnection();
		
		String sql = "insert into product values(seq_p_num.nextval, ?, ?, sysdate, ?, ?, ?, ?, ?, default, ?, ?, ?)";
		PreparedStatement pstmt;
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, p.getP_writer());
			pstmt.setString(2, p.getP_name());
			pstmt.setInt(3, p.getP_hits());
			pstmt.setString(4, p.getP_contents());
			pstmt.setString(5, p.getP_img1());
			pstmt.setInt(6, p.getP_price());
			pstmt.setInt(7, p.getP_quantity());
			pstmt.setInt(8, p.getP_cate1());
			pstmt.setInt(9, p.getP_cate2());
			pstmt.setString(10, p.getP_img2());
			
			pstmt.executeUpdate();
		} catch(SQLException e) {
			e.printStackTrace();
		} finally {
			db.disConn();
		}
	}

	@Override
	public void delete(int p_num) {
		conn = db.getConnection();
		
		String sql = "delete product where p_num=?";
		PreparedStatement pstmt;
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, p_num);
			
			pstmt.executeUpdate();
		} catch(SQLException e) {
			e.printStackTrace();
		} finally {
			db.disConn();
		}
		
	}

	@Override
	public void update(Product p) {
		conn = db.getConnection();
		
		String sql = "update shop_product set p_name=?, p_date=sysdate, p_contents=?, p_img1=?, p_price=?, p_quantity=?, p_cate1=?, p_cate2=?, p_img2=? where p_num=?";
		PreparedStatement pstmt;
		
		try {
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setString(1, p.getP_name());
			pstmt.setString(2, p.getP_contents());
			pstmt.setString(3, p.getP_img1());
			pstmt.setInt(4, p.getP_price());
			pstmt.setInt(5, p.getP_quantity());
			pstmt.setInt(7, p.getP_cate1());
			pstmt.setInt(8, p.getP_cate2());
			pstmt.setString(9, p.getP_img2());
			pstmt.setInt(10, p.getP_num());
			
			
			pstmt.executeUpdate();
		} catch(SQLException e) {
			e.printStackTrace();
		} finally {
			db.disConn();
		}
		
	}

	@Override
	public Product select(int p_num) {
		ResultSet rs;
		Product p = null;
		
		conn = db.getConnection();
		
		String sql = "select * from product where p_num=?";
		PreparedStatement pstmt;
		
		try {
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setInt(1, p_num);
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				p = new Product(rs.getInt(1), rs.getString(2), rs.getString(3), rs.getDate(4),
						rs.getInt(5), rs.getString(6), rs.getString(7), rs.getInt(8),
						rs.getInt(9), rs.getDouble(10), rs.getInt(11), rs.getInt(12),
						rs.getString(13));
			}
		}catch(SQLException e) {
			e.printStackTrace();
		} finally {
			db.disConn();
		}
		return p;
	}

	@Override
	public ArrayList<Product> selectAll(int optionVal, int p_cate1, int p_cate2) {	// select id=gender1값의 optionvalue 값에 따라 sql 문이 달라져야함
		ResultSet rs;
		ArrayList<Product> list = new ArrayList<Product>();
		
		conn = db.getConnection();
		
		String sql = "";
		if(p_cate2 == 0) {
			switch(optionVal) {
			case 0:	// 최신순
				sql = "select * from product where p_cate1=? or p_cate2=0 order by p_num desc";
				break;
			case 1:	// 리뷰많은순
				sql = "select count(*), p.p_num, p.p_writer, p.p_name, p.p_date, p.p_hits, p.p_contents, p.p_img1, p.p_price, p.p_quantity, p.p_eval, p.p_cate1, p.p_cate2, p.p_img2 "
						+ "from product p join productReps pr "
						+ "on p.p_num = pr.preps_p_num "
						+ "where p.p_cate1=? or p.p_cate2 "
						+ "group by p.p_num, p.p_writer, p.p_name, p.p_date, p.p_hits, p.p_contents, p.p_img1, p.p_price, p.p_quantity, p.p_eval, p.p_cate1, p.p_cate2, p.p_img2 "
						+ "order by 1 desc;";
				break;
			case 2:	// 가격낮은순
				sql = "select * from product where p_cate1=? or p_cate2=? order by p_price";
				break;
			case 3:	// 가격 높은순
				sql = "select * from product where p_cate1=? or p_cate2=? order by p_price desc";
				break;
			default:
				sql = "select * from product where p_cate1=? or p_cate2=0 order by p_num desc";
				break;
			}
		} else {
			switch(optionVal) {
			case 0:	// 최신순
				sql = "select * from product where p_cate1=? and p_cate2=? order by p_num desc";
				break;
			case 1:	// 리뷰많은순
				sql = "select count(*), p.p_num, p.p_writer, p.p_name, p.p_date, p.p_hits, p.p_contents, p.p_img1, p.p_price, p.p_quantity, p.p_eval, p.p_cate1, p.p_cate2, p.p_img2 "
						+ "from product p join productReps pr "
						+ "on p.p_num = pr.preps_p_num "
						+ "where p.p_cate1=? and p.p_cate2=? "
						+ "group by p.p_num, p.p_writer, p.p_name, p.p_date, p.p_hits, p.p_contents, p.p_img1, p.p_price, p.p_quantity, p.p_eval, p.p_cate1, p.p_cate2, p.p_img2 "
						+ "order by 1 desc;";
				break;
			case 2:	// 가격낮은순
				sql = "select * from product where p_cate1=? and p_cate2=? order by p_price";
				break;
			case 3:	// 가격 높은순
				sql = "select * from product where p_cate1=? and p_cate2=? order by p_price desc";
				break;
			default:
				sql = "select * from product where p_cate1=? and p_cate2=? order by p_num desc";
				break;
			}
		}
		
		PreparedStatement pstmt;
		try {
			pstmt = conn.prepareStatement(sql);
			
			if(p_cate2 == 0) {
				pstmt.setInt(1, p_cate1);
			} else {
				pstmt.setInt(1, p_cate1);
				pstmt.setInt(2, p_cate2);
			}
			
			rs = pstmt.executeQuery();
			
			while (rs.next()) {
				if(optionVal == 1) {
					list.add(new Product(rs.getInt(2), rs.getString(3), rs.getString(4), rs.getDate(5),
							rs.getInt(6), rs.getString(7), rs.getString(8), rs.getInt(9),
							rs.getInt(10), rs.getDouble(11), rs.getInt(12), rs.getInt(13),
							rs.getString(14)));
				} else {
					list.add(new Product(rs.getInt(1), rs.getString(2), rs.getString(3), rs.getDate(4),
							rs.getInt(5), rs.getString(6), rs.getString(7), rs.getInt(8),
							rs.getInt(9), rs.getDouble(10), rs.getInt(11), rs.getInt(12),
							rs.getString(13)));
				}
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			db.disConn();
		}
		return list;
	}

	@Override
	public ArrayList<Product> selectByTitle(String p_title) {
		ResultSet rs;
		ArrayList<Product> list = new ArrayList<Product>();
		
		conn = db.getConnection();
		
		String sql = "select * from product where title like '%"+p_title+"%' order by p_num desc";
		PreparedStatement pstmt;
		
		try {
			pstmt = conn.prepareStatement(sql);
			
			rs = pstmt.executeQuery();
			while(rs.next()) {
				list.add(new Product(rs.getInt(1), rs.getString(2), rs.getString(3), rs.getDate(4),
						rs.getInt(5), rs.getString(6), rs.getString(7), rs.getInt(8),
						rs.getInt(9), rs.getDouble(10), rs.getInt(11), rs.getInt(12),
						rs.getString(13)));
			}
		} catch(SQLException e) {
			e.printStackTrace();
		} finally {
			db.disConn();
		}
		return list;
	}

	@Override
	public ArrayList<Product> selectBySeller(String p_writer) {
		ResultSet rs;
		ArrayList<Product> list = new ArrayList<Product>();
		
		conn = db.getConnection();
		
		String sql = "select * from product where p_writer=? order by p_num desc";
		PreparedStatement pstmt;
		
		try {
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setString(1, p_writer);
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				list.add(new Product(rs.getInt(1), rs.getString(2), rs.getString(3), 
						rs.getDate(4), rs.getInt(5), rs.getString(6), rs.getString(7), 
						rs.getInt(8), rs.getInt(9), rs.getDouble(10), rs.getInt(11), 
						rs.getInt(12), rs.getString(13)));
			}
		} catch(SQLException e) {
			e.printStackTrace();
		} finally {
			db.disConn();
		}
		return list;
	}

	@Override
	public void updateHits(int num) {
		// TODO Auto-generated method stub
		// 1. 커넥션 수립
		Connection conn = db.getConnection();
		
		// 2. sql문 작성
		String sql = "update product set p_hits=p_hits+1 where p_num=?";
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
