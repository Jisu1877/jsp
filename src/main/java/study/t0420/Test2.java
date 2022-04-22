package study.t0420;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/tt02Ok")
public class Test2 extends HttpServlet{
	@Override
	protected void service(HttpServletRequest requset, HttpServletResponse response) throws ServletException, IOException {
		requset.setCharacterEncoding("utf-8");
		response.setContentType("text/html; charset=utf-8");

		PrintWriter out = response.getWriter();
		
		int num = Integer.parseInt(requset.getParameter("num"));
		
		int num2 = num * num;
		
		out.println("입력하신 수의 거듭제곱 값 : " + num2);
		out.println("<p><a href='"+requset.getContextPath()+"/0420/test2.jsp'>돌아가기</a></p>");
		
		
	}
}
