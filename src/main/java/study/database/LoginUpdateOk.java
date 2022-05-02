package study.database;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet("/loginUpdateOk")
public class LoginUpdateOk extends HttpServlet {
	@Override
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session = request.getSession();
		
		LoginVO vo = new LoginVO();
		//세션에 저장했던 mid 가져오기
		String mid = (String) session.getAttribute("sMid");
		String pwd = request.getParameter("pwd") == null ? "" : request.getParameter("pwd");
		String name = request.getParameter("name") == null ? "" : request.getParameter("name");
		
		vo.setMid(mid);
		vo.setPwd(pwd);
		vo.setName(name);
		
		//DAO 생성. 데이터베이스 연동.
		LoginDAO dao = new LoginDAO();
		int res = 0;
		if(mid != null) { 
			res = dao.setUpdate(vo);
		}
		PrintWriter out = response.getWriter();
		
		if(res == 1) {
			session.setAttribute("sName", name); //name 대신에 vo.getName()도 가능하다.
			
			out.println("<script>");
			out.println("alert('회원정보가 수정되었습니다.');");
			out.println("location.href='"+request.getContextPath()+"/loginUpdate';");
			out.println("</script>");
		}
	}
}
