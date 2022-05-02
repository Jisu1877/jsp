package study.database;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet("/loginList")
public class LoginList extends HttpServlet{
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
		
		LoginDAO dao = new LoginDAO();
		
		ArrayList<LoginVO> vos = dao.getLoginList();
		
		request.setAttribute("vos", vos);
		RequestDispatcher dispatcher = request.getRequestDispatcher("/study/database/loginList.jsp");
		dispatcher.forward(request, response);
	}
}
