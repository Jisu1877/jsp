package study1.ajax;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/ajaxUserUpdate")
public class ajaxUserUpdate extends HttpServlet {
	@Override
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String mid = request.getParameter("mid") == null ? "" : request.getParameter("mid");
		String name = request.getParameter("name") == null ? "" : request.getParameter("name");
		int age = request.getParameter("age") == null ? 0 : Integer.parseInt(request.getParameter("age"));
		String address = request.getParameter("address") == null ? "" : request.getParameter("address");
		
		UserDAO dao = new UserDAO();
		
		String res = dao.setUserUpdate(mid,name,age,address);
		
		response.getWriter().write(res);
	}
}
