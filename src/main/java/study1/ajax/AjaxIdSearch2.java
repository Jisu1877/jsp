package study1.ajax;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/ajaxIdSearch2")
public class AjaxIdSearch2 extends HttpServlet {
	@Override
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String mid = request.getParameter("mid") == null ? "" : request.getParameter("mid");
		
		UserDAO dao = new UserDAO();
		
		UserVO vo = dao.getIdSearch(mid);
		
		String name = "";
		if(vo.getName() == null) {
			name = "찾는 자료가 없습니다.";
		}
		else {
			name = vo.getName();
		}
		response.getWriter().write(name); //응답해줌으로서 헤더에 DB에서 가져온 값을 올려둔다.
	}
}
