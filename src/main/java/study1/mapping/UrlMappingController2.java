package study1.mapping;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("*.url2")  //확장자 패턴
public class UrlMappingController2 extends HttpServlet{
	@Override
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		/* forward와 함께 사용해도 출력되지 않는다. 즉, 함께 사용하지 않는다.
		 * PrintWriter out = response.getWriter(); out.println("<script>");
		 * out.println("alert('콘솔창을 확인해 보세요.');"); //
		 * out.println("location.href='"+request.getContextPath()+"/study1/urlMapping';"
		 * ); //이렇게할거면 그냥 바로 urlMapping.java로 보내지 왜그랬지? => 메세지 띄우려고.. 그래서.. 메세지 호출 컨트롤러가
		 * 필요한것... out.println("</script>");
		 */		
		
		String viewPage = "";
		String uri = request.getRequestURI();
		String com = uri.substring(uri.lastIndexOf("/")+1, uri.lastIndexOf("."));
		
		System.out.println("com : " + com);
		
		if(com.equals("urlMapping")) {
			viewPage = "/WEB-INF/study1/mapping/urlMapping.jsp";
		}
		else if(com.equals("seoul")) {
			viewPage = "/WEB-INF/study1/mapping/seoul.jsp";
		}
		
		RequestDispatcher dispatcher = request.getRequestDispatcher(viewPage);
		dispatcher.forward(request, response);
		
	}
}