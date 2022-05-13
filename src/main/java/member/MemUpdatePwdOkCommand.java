package member;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import conn.SecurityUtil;

public class MemUpdatePwdOkCommand implements MemberInterface {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session = request.getSession();
		
		String mid = (String)session.getAttribute("sMid");
		String pwd1 = request.getParameter("pwd1");
		String pwd2 = request.getParameter("pwd2");
		
		//비밀번호 암호화
		SecurityUtil security = new SecurityUtil();
		pwd1 = security.encryptSHA256(pwd1);
		pwd2 = security.encryptSHA256(pwd2);
		
		MemberDAO dao = new MemberDAO();
		
		MemberVO vo = dao.getMemLoginOk(mid, pwd1);
		
		if(vo.getNickName() == null) {
			request.setAttribute("msg", "memUpdatePwdNo");
			request.setAttribute("url", request.getContextPath()+"/memUpdatePwd.mem");
			return;
		}
		
		int res = dao.setMemUpdatePwd(mid, pwd2);
		
		if(res == 0) {
			request.setAttribute("msg", "memUpdatePwdNoNo");
			request.setAttribute("url", request.getContextPath()+"/memUpdatePwd.mem");
		}
		else {
			request.setAttribute("msg", "memUpdatePwdOk");
			request.setAttribute("url", request.getContextPath()+"/memMain.mem");
		}

	}

}
