package study.t0418;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/T10")
public class Test10 extends HttpServlet{
	
	//service는 doget과 dopost를 우선하는 메소드이다. doget과 dopost를 사용하지 않고 service를 사용할 수 있다.
	//get 방식인지 post 방식인지 상관없다.
	@Override
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		response.setContentType("text/html; charset=utf-8");
		
		String mid = request.getParameter("mid");
		String pwd = request.getParameter("pwd");
		String name = request.getParameter("name");
		
		PrintWriter out = response.getWriter();
		
		out.println("<br/>아이디 : " + mid);
		out.println("<br/>비밀번호 : " + pwd);
		out.println("<br/>성명 : " + name);
		out.println("<br/><a href='"+request.getContextPath()+"/0418/test09.jsp'>돌아가기</a>");
	}
}
