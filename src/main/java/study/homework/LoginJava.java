package study.homework;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet("/loginJava")
public class LoginJava extends HttpServlet {
	@Override
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//한글처리(filter에서 처리했음)
		
		String mid = request.getParameter("mid") == null ? "" : request.getParameter("mid");
		String pwd = request.getParameter("pwd") == null ? "" : request.getParameter("pwd");
		String remember = request.getParameter("remember") == null ? "" : request.getParameter("remember");
		
		Login50VO vo = null;
		
		Login50DAO dao = new Login50DAO();
		PrintWriter out = response.getWriter();
		
		//로그인 체크
		vo = dao.loginCheck(mid,pwd);
		
		if(vo.getName() == null) {
			out.println("<script>");
			out.println("alert('입력하신 아이디와 비밀번호를 확인해주세요');");
			out.println("location.href='"+request.getContextPath()+"/homework/0424/loginHome.jsp';");
			out.println("</script>");
		}
		else {
			//1. 세션에 아이디를 저장시킨다.
			//2. 로그인 폼에서 '아이디저장'을 선택한 경우는 '아이디'를 쿠키에 저장한다.
			//3. 방문 카운트 수 1 증가
			//4. 최종 방문일자 업데이트
			//5. 포인트 5씩 증가
			//6. 정상 로그인이 되면 회원메인페이지로 보내기
			
			//1. 세션에 아이디를 저장시키기
			HttpSession session = request.getSession();
			session.setAttribute("sMId", mid);
			session.setAttribute("sName", vo.getName());
			
//			//2. 로그인 폼에서 '아이디저장'을 선택한 경우는 '아이디'를 쿠키에 저장한다.
//			if(remember.equals("remember")) {
//				Cookie cookieMid = new Cookie("cMid", mid);
//				cookieMid.setMaxAge(24*60*60);
//				response.addCookie(cookieMid);
//			}
//			// 아이디 저장을 해제한 경우 쿠키를 삭제처리한다.
//			else if(remember.equals("none")) {
//				Cookie[] cookies = request.getCookies();
//				if(cookies != null) {
//					for(int i=0; i<cookies.length; i++) {
//						cookies[i].setMaxAge(0);
//						response.addCookie(cookies[i]);
//					}
//				}
//			}
			
			//3/4/5. 포인트 5씩 증가/ 방문 카운트 수 1 증가/ 최종 방문일자 업데이트
			vo = dao.setUpdate(mid);
			
			String href = request.getContextPath() + "/homework/0424/home.jsp?vCount="+vo.getvCount()+"&name="+vo.getName()+"&point="+vo.getPoint();
		
			out.println("<script>");
			out.println("alert('"+vo.getName()+"님 로그인되었습니다.');");
			out.println("location.href='" + href + "'");
			out.println("</script>");
			
		}
	}
}
