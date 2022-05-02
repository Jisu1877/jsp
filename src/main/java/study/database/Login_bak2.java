package study.database;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/*@WebServlet("/login")*/
public class Login_bak2 extends HttpServlet {
	@Override
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//한글처리(filter에서 처리했음)
		
		String mid = request.getParameter("mid") == null ? "" : request.getParameter("mid");
		String pwd = request.getParameter("pwd") == null ? "" : request.getParameter("pwd");
		
		//DAO객체 생성 -> 생성과 동시에 데이터베이스 연동 처리
		LoginDAO dao = new LoginDAO();
		
		//System.out.println("데이터베이스 연결 성공~~~");
		
		//DAO에 가서 로그인 체크하기.
		//String name = dao.loginCheck(mid,pwd);
		LoginVO vo = dao.loginCheck(mid,pwd);
		
		PrintWriter out = response.getWriter();
		
		if(vo.getName() == null) { 	//자료를 못 찾았음.
			out.println("<script>");
			out.println("alert('로그인 실패!');");
			out.println("location.href='"+request.getContextPath()+"/study/database/login.jsp';");
			out.println("</script>");
		}
		else {	// 자료를 못 찾았음...
			// 정상 로그인 처리수행 과정에서 할일들
			// 1. 세션에 아이디를 저장시킨다.
			// 2. 로그인 폼에서 '아이디저장'을 선택한 경우는 '아이디'를 쿠키에 저장, 선택해제시는 쿠키에서 삭제처리한다.(보류)
			// 3. 한번 접속할 때마다 접속포인트 1씩을 증가시켜준다.
			// 4. 방문 카운트 수 1 증가.
			// 5. 정상 로그인되면 회원메인페이지로 보낸다.
			
			//1. 세션에 아이디를 저장시킨다.
			HttpSession session = request.getSession();
			session.setAttribute("sMid", mid); //sMid란 이름으로 변수 mid의 값을 저장.
			session.setAttribute("sName", vo.getName());
			
			// 3/4. 한번 접속할 때마다 접속포인트 1씩을 증가시켜주고, 방문횟수를 각각 1씩 증가시킨다.
			dao.setUpdate(mid);
			
			//메세지 호출컨트롤러가 필요함...
			
			out.println("<script>");
			out.println("alert('"+vo.getName()+"님 로그인 되셨습니다.');");
			//response.sendRedirect 방식으로 넘기기(location.href 이 동일)  =>loginMain.jsp에서 request.getParameter로 값을 받아야한다.
			//out.println("location.href='"+request.getContextPath()+"/study/database/loginMain.jsp?point="+vo.getPoint()+"&vCount="+vo.getvCount()+"';");
			out.println("</script>");
			
			//back단 명령어를 먼저 수행해서 위에 script를 수행하지 않는다.(메세지가 뜨지 않는다. => 화면만 loginMain.jsp 으로 넘어가고 주소는 Login.java에 머물러 있는 문제 발생..)
			request.setAttribute("vo", vo); //vo객체 자체를 값을 담아도 된다.
			//request.setAttribute("point", vo.getPoint());
			//request.setAttribute("vCount", vo.getvCount());
			
			//forward로 보내면 화면만 loginMain.jsp 으로 넘어가고 주소는 Login.java에 머물러 있는 문제 발생.. (메세지 호출컨트롤러로 메세지를 띄우고 주소를 아예 이동 시켜줘야한다.)
			//그렇게되면 loginMain.jsp에서 다른 페이지로 이동하는데 문제가 생긴다..(페이지이동의 출발을 loginMain.jsp에서 해야하는데, Login.java에서 하게 된다.)
			RequestDispatcher dispatcher = request.getRequestDispatcher("/study/database/loginMain.jsp");
			dispatcher.forward(request, response);
		}
	}
}
