package study.homework;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class Login50DAO {
	private Connection conn = null;
	private PreparedStatement pstmt = null;
	private ResultSet rs = null;
	
	private String sql = "";
	
	Login50VO vo = null;
	
	private String url = "jdbc:mysql://localhost:3306/javagreen";
	private String user = "root";
	private String password = "1234";
	
	public Login50DAO() {
		try {
			Class.forName("com.mysql.jdbc.Driver");
			conn = DriverManager.getConnection(url, user, password);
		} catch (ClassNotFoundException e) {
			System.out.println("드라이버 검색실패~~");
		} catch (SQLException e) {
			System.out.println("데이터베이스 연동실패~~");
		}
	}
	
	public void pstmtClose() {
		if(pstmt != null) {
			try {
				pstmt.close();
			} catch (SQLException e) {}
		}
	}

	public void rsClose() {
		if(rs != null) {
			try {
				rs.close();
				pstmtClose();
			} catch (SQLException e) {}
		}
	}
	
	//로그인 체크
	public Login50VO loginCheck(String mid, String pwd) {
		vo = new Login50VO();
		try {
			sql = "select * from login50 where mid = ? and pwd = ?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, mid);
			pstmt.setString(2, pwd);
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				vo.setName(rs.getString("name"));
				vo.setPoint(rs.getInt("point"));
				vo.setvCount(rs.getInt("vCount"));
			}
		} catch (SQLException e) {
			System.out.println("SQL에러 : " + e.getMessage());
		} finally {
			rsClose();
		}
		return vo;
	}
	
	//방문카운트 1 씩 증가/ 포인트 1씩 증가/ 최종접속일자 업데이트
	public Login50VO setUpdate(String mid) {
		vo = new Login50VO();
		try {
			sql = "update login50 set vCount = vCount + 1, point = point + 5, lastDate = now() where mid = ?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, mid);
			pstmt.executeUpdate();
			pstmtClose();
			
			sql = "select * from login50 where mid = ?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, mid);
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				vo.setPoint(rs.getInt("point"));
				vo.setvCount(rs.getInt("vCount"));
				vo.setLastDate(rs.getString("lastDate"));
				vo.setName(rs.getString("name"));
			}
		} catch (SQLException e) {
			System.out.println("SQL에러 : " + e.getMessage());
		} finally {
			rsClose();
		}
		return vo;
	}
}
