package member;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.oreilly.servlet.MultipartRequest;

@WebServlet("*.mem")
public class MemberController extends HttpServlet {
	@Override
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		MemberInterface command = null;
		String viewPage = "/WEB-INF";
		String uri = request.getRequestURI();
		String com = uri.substring(uri.lastIndexOf("/")+1,uri.lastIndexOf("."));
		
		//세션이 끊겼으면 작업의 진행을 홈으로 보낸다.(비정상적인 접근)
		HttpSession session = request.getSession();
		int level = session.getAttribute("sLevel") == null ? 99 : (int)session.getAttribute("sLevel");
		
		
		if(com.equals("memLogin")) {
			command = new MemLoginCommand();
			command.execute(request, response);
			viewPage += "/member/memLogin.jsp";
		}
		else if(com.equals("memLoginOk")) {
			command = new MemLoginOkCommand();
			command.execute(request, response);
			viewPage = "/message/message.jsp";
		}
		else if(com.equals("memJoin")) {
			viewPage += "/member/memJoin.jsp";
		}
		else if(com.equals("memJoinOk")) {
			command = new MemJoinOkCommand();
			command.execute(request, response);
			viewPage = "/message/message.jsp";
		}
		else if(com.equals("memIdCheck")) {
			command = new MemIdCheckCommand();
			command.execute(request, response);
			viewPage += "/member/memIdCheck.jsp";
		}
		else if(com.equals("memNickCheck")) {
			command = new MemNickCheckCommand();
			command.execute(request, response);
			viewPage += "/member/memNickCheck.jsp";
		}
		else if(com.equals("memIdFind")) {
			viewPage += "/member/memIdFind.jsp";
		}
		else if(com.equals("memIdFindOk")) {
			command = new MemIdFindCommand();
			command.execute(request, response);
			viewPage += "/member/memIdFind.jsp";
		}
		else if(com.equals("memPwdFind")) {
			viewPage += "/member/memPwdFind.jsp";
		}
		else if(com.equals("memPwdFindOk")) {
			command = new MemPwdFindCommand();
			command.execute(request, response);
			viewPage = "/message/message.jsp";
		}
		else if(level == 99) { //세션이 끊겼으면 작업의 진행을 홈으로 보낸다.(비정상적인 접근)
			RequestDispatcher dispatcher = request.getRequestDispatcher("/");
			dispatcher.forward(request, response);
		}
		else if(com.equals("memLogOut")) {
			command = new MemLogOutCommand();
			command.execute(request, response);
			viewPage = "/message/message.jsp";
		}
		else if(com.equals("memMain")) {
			command = new MemMainCommand();
			command.execute(request, response);
			viewPage += "/member/memMain.jsp";
		}
		else if(com.equals("memPwdInput")) {
			viewPage += "/member/memPwdInput.jsp";
		}
		else if(com.equals("memPwdInputOk")) {
			command = new MemPwdInputOkCommand();
			command.execute(request, response);
			viewPage = "/message/message.jsp";
		}
		else if(com.equals("memList")) {
			command = new MemListCommand();
			command.execute(request, response);
			viewPage += "/member/memList.jsp";
		}
		else if(com.equals("memInfor")) {
			command = new MemInforCommand();
			command.execute(request, response);
			viewPage = "/controller/controller.jsp";
		}
		else if(com.equals("memInforOk")) {
			command = new MemInforOkCommand();
			command.execute(request, response);
			viewPage += "/member/memInfor.jsp";
		}
		else if(com.equals("adInforOk")) {
			command = new AdInforOkCommand();
			command.execute(request, response);
			viewPage += "/member/memInfor_admin.jsp";
		}
		else if(com.equals("memDelete")) {
			command = new MemDeleteCommand();
			command.execute(request, response);
			viewPage = "/message/message.jsp";
		}
		else if(com.equals("memUserDelete")) {
			command = new MemUserDeleteCommand();
			command.execute(request, response);
			viewPage = "/message/message.jsp";
		}
		else if(com.equals("memUpdate")) {
			command = new MemUpdateCommand();
			command.execute(request, response);
			viewPage += "/member/memUpdate.jsp";
		}
		else if(com.equals("memUpdateOk")) {
			command = new MemUpdateOkCommand();
			command.execute(request, response);
			viewPage = "/message/message.jsp";
		}
		else if(com.equals("memUpdatePwd")) {
			command = new MemUpdatePwdCommand();
			command.execute(request, response);
			viewPage = "/message/message.jsp";
		}
		
		
		RequestDispatcher dispatcher = request.getRequestDispatcher(viewPage);
		dispatcher.forward(request, response);
	}
}
