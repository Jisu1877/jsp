package member;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

public class MemInforOkCommand implements MemberInterface {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session = request.getSession();
		String choseMid = (String) session.getAttribute("choseMid");
		
		MemberDAO dao = new MemberDAO();
		MemberVO vo = dao.getUserInfor(choseMid);
		
		String strLevel = "";
		if(vo.getLevel() == 0) {
			strLevel = "관리자";
		}
		else if(vo.getLevel() == 1) {
			strLevel = "준회원";
		}
		else if(vo.getLevel() == 2) {
			strLevel = "정회원";
		}
		else if(vo.getLevel() == 3) {
			strLevel = "우수회원";
		}
		else if(vo.getLevel() == 4) {
			strLevel = "운영자";
		}
		vo.setStrLevel(strLevel);
		
//		request.setAttribute("strLevel", strLevel);
//		request.setAttribute("point", vo.getPoint());
//		request.setAttribute("lastDate", vo.getLastDate());
//		request.setAttribute("visitCnt", vo.getVisitCnt());
//		request.setAttribute("todayCnt", vo.getTodayCnt()); 
		//위처럼 이렇게 다 담지말고 vo로 한번에 넘기는 것이 좋다.
		request.setAttribute("vo", vo);
	}

}
