package study.database;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet("/loginSearch")
public class LoginSearch extends HttpServlet{
	@Override
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session = request.getSession();
		
		//세션에 저장했던 mid 가져오기
		String mid = (String) session.getAttribute("sMid");
		
		//보안처리(비정상로그인시)
		if(mid == null) {
			response.sendRedirect(request.getContextPath() + "/log");
			return;
		}
		//DAO 생성. 데이터베이스 연동.
		LoginDAO dao = new LoginDAO();
		LoginVO vo = dao.getSearch(mid);
//		//비정상 접근일땐 mid가 null이기 때문에 dao접근을 막아야한다.
//		if(mid != null) { //null이 아닐때만 dao 접근.
//			//dao의 메소드 호출. vo객체로 값 받기
//			vo = dao.getSearch(mid);
//		}
		request.setAttribute("vo", vo);
		RequestDispatcher dispatcher = request.getRequestDispatcher("/study/database/loginSearch.jsp");
		dispatcher.forward(request, response);
		
	}
}
