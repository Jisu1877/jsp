package guest;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

public class GuestDAO {
	private Connection conn = null;
	private PreparedStatement pstmt = null;
	private ResultSet rs = null;
	
	private String sql = "";
	GuestVO vo = null;

	String url = "jdbc:mysql://localhost:3306/javagreen";
	String user = "root";
	String password = "1234";
	
	// 객체 생성시에 DB연동한다.
	public GuestDAO() {
		try {
			Class.forName("com.mysql.jdbc.Driver");
			conn = DriverManager.getConnection(url, user, password);
		} catch (ClassNotFoundException e) {
			System.out.println("드라이버 검색 실패~~");
		} catch (SQLException e) {
			System.out.println("데이터 베이스 연동 실패~");
		}
	}
	
	//객체 메모리에서 소멸시키기..
	
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
	
	//전체 방명록 리스트 검색
	public ArrayList<GuestVO> getGuestList() {
		ArrayList<GuestVO> vos = new ArrayList<GuestVO>();
		try {
			sql = "select * from guest order by idx desc";
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				vo = new GuestVO();
				vo.setIdx(rs.getInt("idx"));
				vo.setName(rs.getString("name"));
				vo.setEmail(rs.getString("email"));
				vo.setHomepage(rs.getString("homepage"));
				vo.setvDate(rs.getString("vDate"));
				vo.setHostIp(rs.getString("hostIp"));
				vo.setContent(rs.getString("content"));
				
				vos.add(vo);
			}
		} catch (SQLException e) {
			System.out.println("sql 에러 : "  + e.getMessage());
		} finally {
			rsClose();
		}
		return vos;
	}
	
	//전체 방명록 리스트 검색
	public ArrayList<GuestVO> getGuestListHome() {
		ArrayList<GuestVO> vos = new ArrayList<GuestVO>();
		try {
			sql = "select * from guest order by idx desc limit ?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, 5);
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				vo = new GuestVO();
				vo.setIdx(rs.getInt("idx"));
				vo.setName(rs.getString("name"));
				vo.setEmail(rs.getString("email"));
				vo.setHomepage(rs.getString("homepage"));
				vo.setvDate(rs.getString("vDate"));
				vo.setHostIp(rs.getString("hostIp"));
				vo.setContent(rs.getString("content"));
				
				vos.add(vo);
			}
		} catch (SQLException e) {
			System.out.println("sql 에러 : "  + e.getMessage());
		} finally {
			rsClose();
		}
		return vos;
	}
	
	//방명록 등록
	public int setGuestInput(GuestVO vo) {
		int res = 0;
		try {
			sql = "insert into guest values(default, ? , ? , ? , default, ? , ? )";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, vo.getName());
			pstmt.setString(2, vo.getEmail());
			pstmt.setString(3, vo.getHomepage());
			pstmt.setString(4, vo.getHostIp());
			pstmt.setString(5, vo.getContent());
			pstmt.executeUpdate();
			res = 1;
		} catch (SQLException e) {
			System.out.println("sql 에러 : "  + e.getMessage());
		} finally {
			pstmtClose();
		}
		return res;
	}

	//방명록 삭제하기
	public int setGuestDelete(int idx) {
		int res = 0;
		try {
			sql = "delete from guest where idx = ?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, idx);
			pstmt.executeUpdate(); //에러가 나면 여기서 나기 때문에..
			res = 1;				//여기까지 내려오면 sql에러가 나지 않은거라서.. res에 1을 담았다..
		} catch (SQLException e) {
			System.out.println("sql 에러 : "  + e.getMessage());
		} finally {
			pstmtClose();
		}
		return res;
	}
	
	//총 레코드 건수 구하기
	public int totRecCnt() {
		int totRecCnt = 0;
		try {
			//sql = "select count(*) from guest";  select 문 뒤에 1번째
			sql = "select count(*) as cnt from guest";
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			
			rs.next();
			//totRecCnt = rs.getInt(1);  그래서 1
			totRecCnt = rs.getInt("cnt");
		} catch (SQLException e) {
			System.out.println("sql 에러 : "  + e.getMessage());
		} finally {
			rsClose();
		}
	
		return totRecCnt;
	}
	
	// 한페이지의 분량을 정해서 불러온다.(페이징처리)
	public ArrayList<GuestVO> getGuestList(int startIndexNo, int pageSize) {
		ArrayList<GuestVO> vos = new ArrayList<GuestVO>();
		try {
			sql = "select * from guest order by idx desc limit ?, ?"; //limit [처음인덱스번호, 개수] (처음인덱스번호부터 몇개 출력?)
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, startIndexNo);
			pstmt.setInt(2, pageSize);
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				vo = new GuestVO();
				vo.setIdx(rs.getInt("idx"));
				vo.setName(rs.getString("name"));
				vo.setEmail(rs.getString("email"));
				vo.setHomepage(rs.getString("homepage"));
				vo.setvDate(rs.getString("vDate"));
				vo.setHostIp(rs.getString("hostIp"));
				vo.setContent(rs.getString("content"));
				
				vos.add(vo);
			}
		} catch (SQLException e) {
			System.out.println("sql 에러 : "  + e.getMessage());
		} finally {
			rsClose();
		}
		return vos;
	}
	
	
}
