package cate;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import dbconn.DBConnect;
import member.Member;

public class DaoImpl implements Dao {
	private DBConnect db;

	public DaoImpl() {
		db = DBConnect.getInstance();
	}

	@Override
	public Cate selectCate(int num, String table) {
		// TODO Auto-generated method stub
		ResultSet rs;
		Connection conn = db.getConnection();
		String sql = "select * from " + table + " where num=?";
		PreparedStatement pstmt;
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, num);
			rs = pstmt.executeQuery();
			if (rs.next()) {
				if(table.equals("cate1")) {
					return new Cate(rs.getInt(1), rs.getString(2), 0);
				}else {
					return new Cate(rs.getInt(1), rs.getString(2), 
							rs.getInt(3));
				}			
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {//���� �޼��尡 �����ϱ� ���� �� �����ؾ��ϴ� �ڵ� �ۼ�
			db.disConn();
		}
		return null;
	}

	@Override
	public ArrayList<Cate> selectAll(int parent, String table) {
		// TODO Auto-generated method stub
		ResultSet rs;
		ArrayList<Cate> list = new ArrayList<Cate>();
		Connection conn = db.getConnection();
		String sql = "";
		if(table.equals("cate1")) {
			sql = "select * from cate1";
		}else {
			sql = "select * from " + table + " where ct2_parent=?";
		}
		PreparedStatement pstmt;
		try {
			pstmt = conn.prepareStatement(sql);
			if(!table.equals("cate1")) {
				pstmt.setInt(1, parent);
			}
			rs = pstmt.executeQuery();
			while (rs.next()) {
				if(table.equals("cate1")) {
					list.add(new Cate(rs.getInt(1), 
							rs.getString(2), 0));
				}else {
					list.add(new Cate(rs.getInt(1), 
							rs.getString(2), rs.getInt(3)));
				}			
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {//���� �޼��尡 �����ϱ� ���� �� �����ؾ��ϴ� �ڵ� �ۼ�
			db.disConn();
		}
		return list;
	}

	@Override
	public void deleteCate(int num, String table) {
		// TODO Auto-generated method stub
		Connection conn = db.getConnection();
		String sql = "delete "+table+" where num=?";		
		PreparedStatement pstmt;
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, num);
			pstmt.executeUpdate();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		db.disConn();
	}

}
