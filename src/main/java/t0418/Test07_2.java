package t0418;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/T07_2")		//컨트롤러명..
public class Test07_2 extends HttpServlet{
	
	//HttpServlet 이 추상클래스라서 추상메소드인 doPost()메소드를 오버라이드 한다..
	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//한글처리
		response.setContentType("text/html; charset=UTF-8");  //응답설정. 출력하는 형식..
		request.setCharacterEncoding("utf-8"); //웹서버에게 값을 받아오기 위해 요청을 하게되는데, utf-8로 요청하겠다는 설정. 웹서버 헤더안에 값이 들어가 있다.
		
		String mid = request.getParameter("mid");
		String pwd = request.getParameter("pwd");
		
		//화면에 출력할 수 있도록 response의 getWriter() 메소드 호출.
		PrintWriter out = response.getWriter();  //HttpServletResponse 가 PrintWriter를 상속받아서 부모타입으로 변수이름 out으로 받은 것.
		
		out.println("아이디2 : "+mid+"<br/>");
		out.println("비밀번호2 : "+pwd+"<br/>");
		out.println("<a href='/javagreenJ/0418/test07.jsp'>돌아가기</a>");
	}
}
