package member;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

public class MemInforCommand implements MemberInterface {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session = request.getSession();
		
		String mid = request.getParameter("mid") == null ? "" : request.getParameter("mid");
		
		String sMid = (String) session.getAttribute("sMid");
		session.setAttribute("choseMid", mid);
		
//		MemberDAO dao = new MemberDAO();
//		MemberVO vo = dao.getUserInfor(mid);
		
		
		if(sMid.equals("admin")) {
			request.setAttribute("url", request.getContextPath()+"/adInforOk.mem");
		}
		else {
			request.setAttribute("url", request.getContextPath()+"/memInforOk.mem");
		}
	}

}
