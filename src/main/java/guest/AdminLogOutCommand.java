package guest;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

public class AdminLogOutCommand implements GuestInterface {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session = request.getSession();
		
		session.removeAttribute("sAdmin");
		
		request.setAttribute("msg", "adminLogOutOk");
		request.setAttribute("url", request.getContextPath() + "/guestList.gu"); //request.getContextPath()를 썼으면 /도 꼭 써야한다.
	}

}
