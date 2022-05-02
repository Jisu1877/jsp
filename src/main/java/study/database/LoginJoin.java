package study.database;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/loginJoin")
public class LoginJoin extends HttpServlet {
	@Override
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//한글처리...(Filter에서 처리함)
		
		//Form태그에서 넘겨준 부분을 모두 가져와서 중요한 자료를 null값 및 유효성검사 처리 후 VO에 담아서, DAO로 이동하여 자료를 저장시킨다.
		String mid = request.getParameter("mid") == null ? "" : request.getParameter("mid");
		String pwd = request.getParameter("pwd") == null ? "" : request.getParameter("pwd");
		String name = request.getParameter("name") == null ? "" : request.getParameter("name");
		
		LoginVO vo = new LoginVO();
		
		vo.setMid(mid);
		vo.setPwd(pwd);
		vo.setName(name);
		
		LoginDAO dao = new LoginDAO();
		PrintWriter out = response.getWriter();
		
		//아이디 중복체크
		int res = dao.getIdCheck(mid);
		if(res == 0) { //아이디가 중복된 경우 res는 0을 반환한다.
			out.println("<script>");
			out.println("alert('이미 존재하는 아이디입니다. 새로운 아이디를 입력하세요.');");
			out.println("location.href='"+request.getContextPath()+"/study/database/loginJoin.jsp';");
			out.println("</script>");
			return;
		}
		
		// 회원가입처리
		int res2 = dao.setLoginJoin(vo);  //res2로 안만들고 res로 해도 상관은 없다. 
	
		
		if(res == 1 && res2 == 1) {  //res = 1로만 확인할 수 있지만 혹시 몰라 더블체크로 수정한 것.
			out.println("<script>");
			out.println("alert('회원가입 되었습니다.');");
			out.println("location.href='"+request.getContextPath()+"/study/database/login.jsp';");
			out.println("</script>");
		}
		else {
			out.println("<script>");
			out.println("alert('회원가입 실패');");
			out.println("location.href='"+request.getContextPath()+"/study/database/loginJoin.jsp';");
			out.println("</script>");
		}
	}
}
