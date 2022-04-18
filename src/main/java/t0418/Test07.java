package t0418;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class Test07
 */
@WebServlet("/T07")
public class Test07 extends HttpServlet {
       
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("text/html; charset=UTF-8");  //응답설정. 출력하는 형식..
		request.setCharacterEncoding("utf-8"); //요청형식..
		
		String mid = request.getParameter("mid");
		String pwd = request.getParameter("pwd");
		
		System.out.println("mid : " + mid);
		System.out.println("pwd : " + pwd);
		
		//화면에 출력할 수 있도록 response를 통해 getWriter() 메소드 호출.
		PrintWriter out = response.getWriter();  //HttpServletResponse 가 PrintWriter를 상속받아서 부모타입으로 변수이름 out으로 받은 것.
		
		out.println("아이디 : "+mid+"<br/>");
		out.println("비밀번호 : "+pwd+"<br/>");
		out.println("<a href='/javagreenJ/0418/test07.jsp'>돌아가기</a>");
	}

}
