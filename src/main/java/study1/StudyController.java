package study1;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import study1.ajax1.Ajax1Command;
import study1.sha256.ShaPassOkCommand;

@WebServlet("*.st")
public class StudyController extends HttpServlet{
	@Override
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		StudyInterface command = null;
		String viewPage = "/WEB-INF";
		
		String uri = request.getRequestURI();
		String com = uri.substring(uri.lastIndexOf("/")+1, uri.lastIndexOf("."));
		
		if(com.equals("el")) {
			viewPage += "/study1/el/el1.jsp";
		}
		else if(com.equals("el2")) {
			viewPage += "/study1/el/el2.jsp";
		}
		else if(com.equals("jstl1")) {
			viewPage += "/study1/el_JSTL/jstl1.jsp";
		}
		else if(com.equals("jstl2")) {
			viewPage += "/study1/el_JSTL/jstl2.jsp";
		}
		else if(com.equals("shaPass")) {
			viewPage += "/study1/sha/shaPass.jsp";
		}
		else if(com.equals("shaPassOk")) {
			command = new ShaPassOkCommand();
			command.execute(request, response);
			viewPage += "/study1/sha/shaPass.jsp";
		}
		else if(com.equals("ajax1")) {
			command = new Ajax1Command();
			command.execute(request, response);
			viewPage += "/study1/ajax/ajax1.jsp";
		}
		
		RequestDispatcher dispatcher = request.getRequestDispatcher(viewPage);
		dispatcher.forward(request, response);
	}
}
