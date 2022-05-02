package study.t0420;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/sungjukOk")
public class SungjukOk extends HttpServlet {
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
		String[] sports = request.getParameterValues("sports");
		String otherSports = request.getParameter("otherSports") == null ? "" : request.getParameter("otherSports");
		String[] language = request.getParameterValues("language");
		
//		if(name.equals("") || gender.equals("") || no.equals("") || hakyun.equals("") || kor.equals("") || eng.equals("") || mat.equals("")) {
//			out.println("<script>");
//			out.println("alert('모든 입력칸은 필수로 입력하셔야 합니다.');");
//			out.println("history.back();");
//			out.println("</script>");
//			return;
//		}
		String strSports = "";
		String strlanguage = "";
		if(sports != null) {
			for(String sport : sports) {
				if(sport.equals("기타")) {
					if(otherSports.trim().length() <= 0) {
						out.println("<script>");
						out.println("alert('기타항목을 선택하셨으면 기타란에 입력하세요');");
						out.println("history.back();");
						out.println("</script>");
						return;
					}
					strSports += otherSports + "/";
				}
				if(!sport.equals("기타")) {
					strSports += sport + "/";
				}
			}
		}
		else {
			out.println("<script>");
			out.println("alert('좋아하는 스포츠를 1개 이상 입력하세요.');");
			out.println("history.back();");
			out.println("</script>");
			return;
		}
		if(language == null) {
			out.println("<script>");
			out.println("alert('사용가능한 언어를 선택하세요.');");
			out.println("history.back();");
			out.println("</script>");
			return;
		}
		else {
			for(String lang : language) {
				strlanguage += lang + "/";
			}
		}
		
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
		/*
		 * SungjukVO vo = new SungjukVO(name, gender, no, hakyun, intKor, intEng,
		 * intMat, tot, avg, grade, sports, otherSports, language, strSports,
		 * strlanguage);
		 */
		
		SungjukVO vo = new SungjukVO();
		int Inthakyun = Integer.parseInt(hakyun);
		
		if(0 > Inthakyun || 7 < Inthakyun) {
			out.println("<script>");
			out.println("alert('학년은 1학년부터 6학년까지 입력가능합니다.');");
			out.println("history.back();");
			out.println("</script>");
			return;
		}
		else if(0 > intKor || 100 < intKor || 0 > intEng|| 100 < intEng || 0 > intMat || 100 < intMat) {
			out.println("<script>");
			out.println("alert('점수의 범위는 0점부터 100점까지 입니다.');");
			out.println("history.back();");
			out.println("</script>");
			return;
		}
		else {
			vo.setMat(intMat);
			vo.setEng(intEng);
			vo.setKor(intKor);
			vo.setHakyun(hakyun);
			vo.setName(name);
			vo.setGender(gender);
			vo.setNo(no);
			vo.setTot(tot);
			vo.setAvg(avg);
			vo.setGrade(grade);
			vo.setSports(sports);
			vo.setStrSports(strSports);
			vo.setOtherSports(otherSports);
			vo.setStrlanguage(strlanguage);
		}
		
		request.setAttribute("vo", vo);  //request에 데이터 저장(MVC의 M! model~)
		
		// 값을 VO에 담아서 Fornt로 전송한다.
		// 1번 방식 : response.sendRedirect() - request객체에 담은 값과는 상관없이 get방식으로 전달한다.
		// response.sendRedirect(request.getContextPath()+"/0420/sungjukView.jsp?vo="+vo);
		
		// 2번 방식 : forword방식
		RequestDispatcher dispatcher = request.getRequestDispatcher("/0420/sungjukView.jsp");
		dispatcher.forward(request, response);
	}
}
