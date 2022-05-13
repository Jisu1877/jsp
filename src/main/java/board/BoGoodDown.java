package board;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import study1.ajax.UserDAO;

@WebServlet("/boGoodDown")
public class BoGoodDown extends HttpServlet {
	@Override
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int idx = request.getParameter("idx") == null ? 0 : Integer.parseInt(request.getParameter("idx"));
		
		UserDAO dao = new UserDAO();
		
		HttpSession session = request.getSession();
		//먼저 세션값 읽어오고..(값이 null 인가? 아니면 good+고유번호 인가?)
		ArrayList<String> goodIdx = (ArrayList) session.getAttribute("sGoodIdx");
		if(goodIdx == null) {
			// 비어있으면 새로 생성해준다.
			goodIdx = new ArrayList<String>();
		}
		String imsiGoodIdx = "goodDown" + idx;
		
		//있는지 없는지 검색..
		if(!goodIdx.contains(imsiGoodIdx)) {
			//좋아요수 감소처리하기
			dao.setGoodDown(idx);
			goodIdx.add(imsiGoodIdx);
		}
		// 세션에 set 시키기
		session.setAttribute("sGoodIdx", goodIdx);
	}
}
