package study1.mapping;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("*.url")  //확장자 패턴
public class UrlMappingController extends HttpServlet{
	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		/* service(request, response); */
		actionDo(request, response); 
	}
	
	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		/* doGet(request, response);  post방식으로 부르더라도 get메소드로 가게함.*/
		/* service(request, response); */
		actionDo(request, response); 
	}
	
	//내가 메소드 만들어서 사용.
	protected void actionDo(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		StringBuffer url = request.getRequestURL();
		System.out.println("url : " + url); //전체주소
		
		String uri = request.getRequestURI();
		System.out.println("uri : " + uri); //프로토콜을 뺀 주소
		
//		String com = uri.substring(12, uri.lastIndexOf("."));
		String com = uri.substring(uri.lastIndexOf("/")+1, uri.lastIndexOf("."));  //이름을 부여한 확장자 이름을 찾아오기 위해..
		
		System.out.println("command Object name : " + com);
		
		PrintWriter out = response.getWriter();
		out.println("<script>");	//<script>를 사용하면 forward를 사용하지 않는다. 프론트단 명령어인 <script>를 무시하고 실행되어버리기 때문에.
		out.println("alert('콘솔창을 확인해 보세요.');");
//		out.println("location.href='/WEB-INF/study1/mapping/urlMapping.jsp';"); get방식을 통해서는 /WEB-INF 폴더를 접근할 수 없다.
		out.println("location.href='"+request.getContextPath()+"/study1/urlMapping';");  //이렇게 잘 사용하지 않는다.
		//이렇게할거면 그냥 바로 urlMapping.java로 보내지 왜그랬지? => 메세지 띄우려고.. 그래서.. 메세지 호출 컨트롤러가 필요한것...
		out.println("</script>");
	}
	
	
//	@Override
//	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
//		
//	}
}
