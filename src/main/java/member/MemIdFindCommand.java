package member;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class MemIdFindCommand implements MemberInterface {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String email = request.getParameter("email") == null ? "" : request.getParameter("email");
		
		MemberDAO dao = new MemberDAO();
		
		String mid = dao.memIdFind(email);
		request.setAttribute("mid", mid);
		request.setAttribute("flag", "true");
	}

}
