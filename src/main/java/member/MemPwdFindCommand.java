package member;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class MemPwdFindCommand implements MemberInterface {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String mid = request.getParameter("mid") == null ? "" : request.getParameter("mid");
		String email = request.getParameter("email") == null ? "" : request.getParameter("email");
		
		MemberDAO dao = new MemberDAO();
		
		String name = dao.memPwdFind(mid, email);
		if(!name.equals("")) {
			request.setAttribute("msg", "MemPwdFindOk");
			request.setAttribute("url", request.getContextPath()+"/member/memPwdInput.mem?mid="+mid);
		}
		else {
			request.setAttribute("msg", "MemPwdFindNo");
			request.setAttribute("url", request.getContextPath()+"/member/memPwdFind.mem?name="+name);
		}
	}

}
