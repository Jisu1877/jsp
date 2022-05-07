package admin;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import member.MemberDAO;
import member.MemberVO;

public class AdMemLevelChangeCommand implements AdminInterface {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int idx = Integer.parseInt(request.getParameter("idx"));
		int level = Integer.parseInt(request.getParameter("level"));
		
		MemberDAO dao = new MemberDAO();
		
		dao.setMemLevelChange(idx,level);
		
		//ArrayList<MemberVO> vos = dao.getMemList(0);
		//request.setAttribute("vos", vos);
		
		//메세지쪽으로 가면.. request에 담은 값이 날라간다...
		request.setAttribute("msg", "levelChangeOk");
		request.setAttribute("url", request.getContextPath()+"/adMemList.ad"); //adMemList.ad로 보내서 거기서 다시 vos를 request에 담게한다.
	}

}
