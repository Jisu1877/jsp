package study.t0420;

import java.io.IOException;
import java.io.PrintWriter;
import java.net.URLEncoder;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/sungjukOk3")
public class SungjukOk3 extends HttpServlet {
	@Override
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		response.setContentType("text/html; charset=utf-8");
		PrintWriter out = response.getWriter();
		
		String name = request.getParameter("name") == null ? "" : request.getParameter("name");
		String gender = request.getParameter("gender") == null ? "" : request.getParameter("gender");
		String no = request.getParameter("no") == null ? "" : request.getParameter("no");
		String hakyun = request.getParameter("hakyun") == null ? "" : request.getParameter("hakyun");
		String hakyunOption = request.getParameter("hakyunOption");
		String kor = request.getParameter("kor") == null ? "" : request.getParameter("kor");
		String eng = request.getParameter("eng") == null ? "" : request.getParameter("eng");
		String mat = request.getParameter("mat") == null ? "" : request.getParameter("mat");
		
//		if(name.equals("") || gender.equals("") || no.equals("") || hakyun.equals("") || kor.equals("") || eng.equals("") || mat.equals("")) {
//			out.println("<script>");
//			out.println("alert('모든 입력칸은 필수로 입력하셔야 합니다.');");
//			out.println("history.back();");
//			out.println("</script>");
//			return;
//		}
		String strSports = "";
		String strlanguage = "";
		
		int intKor = Integer.parseInt(kor);
		int intEng = Integer.parseInt(eng);
		int intMat = Integer.parseInt(mat);
		
		int tot = intKor + intEng + intMat;
		double avg = tot / 3.0;
		String grade = null;
		
		if(hakyun.equals("")) hakyun = hakyunOption;
		
		switch ((tot / 3) / 10) {
			case 10:
			case 9:
				grade = "A";
				break;
			case 8:
				grade = "B";
				break;
			case 7:
				grade = "C";
				break;
			case 6:
				grade = "D";
				break;
			default:
				grade = "F";
		}
		SungjukVO3 vo = new SungjukVO3(name, gender, no, hakyun, intKor, intEng, intMat, tot, avg, grade);
		System.out.println("1.server에서의 vo : " + vo);
		
		/*
		 * name = URLEncoder.encode(name); 
		 * vo.setName(name);
		 */
		/* vo.setName(URLEncoder.encode(name)); */
		
		// 값을 VO에 담아서 Fornt로 전송한다.
//		 1번 방식 : response.sendRedirect() - request객체에 담은 값과는 상관없이 get방식으로 전달한다.
		/*
		 * response.sendRedirect(request.getContextPath()+"/0420/sungjukView3.jsp?vo="+
		 * vo); System.out.println("2.server에서의 vo : " + vo);
		 */
		 
		 request.setAttribute("vo", vo); 
		// 2번 방식 : forword방식
		RequestDispatcher dispatcher = request.getRequestDispatcher("/0421/sungjukView3.jsp");
		dispatcher.forward(request, response);
	}
}
