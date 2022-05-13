package member;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class MemMessageCommand implements MemberInterface {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String messageFlag = request.getParameter("messageFlag")==null ? "" : request.getParameter("messageFlag");
		
		if(messageFlag.equals("main")) {
			request.setAttribute("msg", "loginRequest");
			request.setAttribute("url", request.getContextPath()+"/memLogin.mem");
		}
		
		

	}

}
