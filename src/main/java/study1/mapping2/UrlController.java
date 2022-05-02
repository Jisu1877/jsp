package study1.mapping2;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("*.um")
public class UrlController extends HttpServlet{
	@Override
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		UrlInterface command = null;
		String viewPage = "";
		
		String uri = request.getRequestURI();
		String com = uri.substring(uri.lastIndexOf("/")+1, uri.lastIndexOf("."));
		
		if(com.equals("urlMapping")) {
			viewPage = "/WEB-INF/study1/mapping/urlMapping.jsp";
		}
		else if(com.equals("urlMappingList")) {
		//UrlMappingListCommand commands = new UrlMappingListCommand(); //인터페이스를 사용하지 않으려면 이렇게 생성해서 사용.
			command = new UrlMappingListCommand();
			command.execute(request, response); //UrlMappingListCommand() 의 execute메소드 실행 => request.setAttribute("vos", vos); 에서 담은 값 request에 저장실행으로 되어있는 상태(웹서버단)
			viewPage = "/WEB-INF/study1/mapping/urlMappingList.jsp";
		}
		else if(com.equals("urlMappingJoin")) {
			viewPage = "/WEB-INF/study1/mapping/urlMappingJoin.jsp";
		}
		else if(com.equals("urlMappingJoinOk")) {
			command = new UrlMappingJoinOkCommand(); 
			command.execute(request, response); 
			viewPage = "/message/message.jsp";
		}
		else if(com.equals("urlMappingDelete")) {
			command = new UrlMappingDeleteCommand(); 
			command.execute(request, response); 
			viewPage = "/message/message.jsp";
		}
		else if(com.equals("urlMappingUpdate")) {
			command = new UrlMappingUpdateCommand(); 
			command.execute(request, response); 
			viewPage = "/WEB-INF/study1/mapping/urlMappingUpdate.jsp";
		}
		else if(com.equals("urlMappingUpdateOk")) {
			command = new UrlMappingUpdateOkCommand(); 
			command.execute(request, response); 
			viewPage = "/message/message.jsp";
		}

		RequestDispatcher dispatcher = request.getRequestDispatcher(viewPage);
		dispatcher.forward(request, response); //command.execute(request, response); 에서 담은 request값 담아서 forward로 보내기
	}
}
