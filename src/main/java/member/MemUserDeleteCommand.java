package member;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class MemUserDeleteCommand implements MemberInterface {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int idx = Integer.parseInt(request.getParameter("idx"));
		
		MemberDAO dao = new MemberDAO();
		
		int res = dao.setUserDelete(idx);
		
		if(res == 1) {
			request.setAttribute("msg", "UserDeleteOk");
		}
		else {
			request.setAttribute("msg", "UserDeleteNo");
		}
		request.setAttribute("url", request.getContextPath()+"/adMemList.ad");
	}

}
