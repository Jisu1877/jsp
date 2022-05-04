package member;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class MemNickCheckCommand implements MemberInterface {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String nickName = request.getParameter("nickName") == null ? "" : request.getParameter("nickName");
		
		MemberDAO dao = new MemberDAO();
		
		String name = dao.memNickCheck(nickName);
		
		if(name.equals("")) { 
			request.setAttribute("res", 1); //사용가능한 닉네임
		}
		else { 
			request.setAttribute("res", 0); //사용불가(이미 사용중인 닉네임)한 닉네임은 res에 0을 넘겨준다.
		}
		request.setAttribute("nickName", nickName);
	}

}