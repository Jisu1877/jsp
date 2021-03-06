package study.database;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

public class LoginDAO { //DAO : 데이터 액세스 오브젝트
	private Connection conn = null;
	private PreparedStatement pstmt = null;
	private ResultSet rs = null;
	
	private String sql = "";
	
	LoginVO vo = null;
	
	private String url = "jdbc:mysql://localhost:3306/javagreen";
	private String user = "root";
	private String password = "1234";
	
	//DAO를 호출하는 곳에서 생성시와 동시에 DB연동처리한다.
	public LoginDAO() {
		try {
			//JDBC라이브러리 검색
			Class.forName("com.mysql.jdbc.Driver");
			//데이터베이스 연동하기
			conn = DriverManager.getConnection(url, user, password);
		} catch (ClassNotFoundException e) {
			System.out.println("드라이버 검색실패~~");
		} catch (SQLException e) {
			System.out.println("데이터베이스 연동 실패~~");
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
	
	//로그인 체크(id, pwd체크)
	public LoginVO loginCheck(String mid, String pwd) {
		vo = new LoginVO();
		
		try {
			sql = "select * from login where mid = ? and pwd = ?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, mid);
			pstmt.setString(2, pwd);
			rs = pstmt.executeQuery();    //select 명령문일때만 rs객체가 필요하다.
			
			if(rs.next()) {
				vo.setName(rs.getString("name"));
				vo.setPoint(rs.getInt("point"));
				vo.setvCount(rs.getInt("vCount"));
			}
		} catch (SQLException e) {
			System.out.println("SQL 에러 : " + e.getMessage());
		} finally {
			rsClose();
		}
		
		return vo;
	}
	
	//접속포인트와 방문횟수 1씩 증가
	public void setUpdate(String mid) {
		try {
			sql = "update login set point = point + 1, vCount = vCount + 1, lastDate = now() where mid = ?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, mid);
			pstmt.executeUpdate();
			/*
			 * pstmtClose();
			 * 
			 * sql = "update login set vCount = vCount + 1 where mid = ?"; 
			 * pstmt = conn.prepareStatement(sql); 
			 * pstmt.setString(1, mid); pstmt.executeUpdate();
			 */
			
		} catch (SQLException e) {
			System.out.println("SQL 에러 : " + e.getMessage());
		} finally {
			pstmtClose();
		}
	}

	//개별정보조회
	public LoginVO getSearch(String mid) {
		vo = new LoginVO();
		try {
			sql = "select * from login where mid = ?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, mid);
			rs = pstmt.executeQuery();
			
			rs.next();
			
			vo.setIdx(rs.getInt("idx"));
			vo.setMid(mid);
			vo.setPwd(rs.getString("pwd"));
			vo.setName(rs.getString("name"));
			vo.setPoint(rs.getInt("point"));
			vo.setvCount(rs.getInt("vCount"));
			vo.setLastDate(rs.getString("lastDate"));
			
		} catch (SQLException e) {
			System.out.println("SQL 에러 : " + e.getMessage());
		} finally {
			rsClose();
		}
		return vo;
	}
	
	//회원가입 처리하기
	public int setLoginJoin(LoginVO vo) {
		int res = 0;
		try {
			sql = "insert into login values(default, ?, ?, ?, default, default, default)";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, vo.getMid());
			pstmt.setString(2, vo.getPwd());
			pstmt.setString(3, vo.getName());
			pstmt.executeUpdate();
			res = 1;
		} catch (SQLException e) {
			System.out.println("SQL 에러 : " + e.getMessage());
		} finally {
			pstmtClose();
		}
		return res;
	}
	
	
	//아이디 중복체크
	public int getIdCheck(String mid) {
		int res = 0;
		try {
			sql = "select * from login where mid = ?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, mid);
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				res = 0;  	//아이디 중복됨
			}else {
				res = 1;	//아이디 중복되지 않음..
			}
			
		} catch (SQLException e) {
			System.out.println("SQL 에러 : " + e.getMessage());
		} finally {
			rsClose();
		}
		return res;
	}
	
	// 전체 회원보기
	public ArrayList<LoginVO> getLoginList() {
		ArrayList<LoginVO> vos = new ArrayList<LoginVO>();
		try {
			sql = "select * from login order by idx desc";
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				LoginVO vo = new LoginVO();
				vo.setIdx(rs.getInt("idx"));
				vo.setMid(rs.getString("mid"));
				vo.setPwd(rs.getString("pwd"));
				vo.setName(rs.getString("name"));
				vo.setPoint(rs.getInt("point"));
				vo.setvCount(rs.getInt("vCount"));
				vo.setLastDate(rs.getString("lastDate"));
				vos.add(vo);
			}
		} catch (SQLException e) {
			System.out.println("SQL 에러 : " + e.getMessage());
		} finally {
			rsClose();
		}
		return vos;
	}

	//회원삭제
	public int setLoginDelete(String mid) {
		int res = 0;
		try {
			sql = "delete from login where mid = ?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, mid);
			pstmt.executeUpdate();
			res = 1;
		} catch (SQLException e) {
			System.out.println("SQL 에러 : " + e.getMessage());
		} finally {
			pstmtClose();
		}
		return res;
	}
	
	// 회원 정보 수정하기
	public int setUpdate(LoginVO vo) {
		int res = 0;
		try {
			sql = "update login set pwd = ?, name = ? where mid = ?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, vo.getPwd());
			pstmt.setString(2, vo.getName());
			pstmt.setString(3, vo.getMid());
			pstmt.executeUpdate();
			res = 1;
		} catch (SQLException e) {
			System.out.println("SQL 에러 : " + e.getMessage());
		} finally {
			pstmtClose();
		}
		return res;
	}
	
	//관리자 인증확인하기
	public int getAdminCheck(String mid, String pwd) {
		int res = 0;
		try {
			sql = "select mid from login where mid = ? and pwd = ?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, mid);
			pstmt.setString(2, pwd);
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				res = 1;
			}
		} catch (SQLException e) {
			System.out.println("SQL 에러 : " + e.getMessage());
		} finally {
			rsClose();
		}
		return res;
	}
}
