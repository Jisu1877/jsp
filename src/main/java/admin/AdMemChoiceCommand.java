package admin;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import member.MemberDAO;
import member.MemberVO;

public class AdMemChoiceCommand implements AdminInterface {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int choiceLevel = request.getParameter("choiceLevel") == null ? 0 : Integer.parseInt(request.getParameter("choiceLevel"));
		
		MemberDAO dao = new MemberDAO();
		
		ArrayList<MemberVO> vos = dao.getChoiceMemList(choiceLevel);
		
		request.setAttribute("vos", vos);
		request.setAttribute("curScrStartNo", vos.size());
	}

}
