package member;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import conn.SecurityUtil;

public class MemLoginOkCommand implements MemberInterface {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String mid = request.getParameter("mid") == null ? "" : request.getParameter("mid");
		String pwd = request.getParameter("pwd") == null ? "" : request.getParameter("pwd");
		
		//비밀번호 암호화
		SecurityUtil security = new SecurityUtil();
		pwd = security.encryptSHA256(pwd);
		
		MemberDAO dao = new MemberDAO();
		MemberVO vo = dao.getMemLoginOk(mid, pwd);
		
		//로그인 실패
		if(vo.getNickName() == null) {
			request.setAttribute("msg", "loginNo");
			request.setAttribute("url", request.getContextPath()+"/memLogin.mem");
			return;
		}
		
		//로그인 성공
		//1. 주요자료 세션저장하기 2.방문수와 포인터 증가 3.쿠키에 아이디 저장유무?
		HttpSession session = request.getSession();
		
		session.setAttribute("sMid", mid);
		session.setAttribute("sNickName", vo.getNickName());
		session.setAttribute("sLevel", vo.getLevel());
		
		dao.setMemPointUpdate(mid);
		
		String idCheck = request.getParameter("idCheck") == null ? "off" : request.getParameter("idCheck");
		Cookie cookieMid = new Cookie("cMid", mid);
		if(idCheck.equals("on")) {  //아이디 저장 체크 함.
			cookieMid.setMaxAge(24*60*60*7);	// cookieMi 쿠키 만료시간은 7일
		}
		else {
			cookieMid.setMaxAge(0);	// cookieMi 쿠키 삭제
		}
		response.addCookie(cookieMid);
		
		request.setAttribute("msg", "loginOk");
		request.setAttribute("url", request.getContextPath()+"/memMain.mem");
	}

}
