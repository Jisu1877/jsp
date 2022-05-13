package study1.ajax1;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import guest.GuestDAO;
import guest.GuestVO;
import study1.StudyInterface;
import study1.ajax.UserDAO;
import study1.ajax.UserVO;

public class Ajax1Command implements StudyInterface {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		UserDAO dao = new UserDAO();
		
		ArrayList<UserVO> vos = dao.getList();
		
		request.setAttribute("vos", vos);
	}
	
//	@Override
//	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
//		UserDAO dao = new UserDAO();
//		
//		int pag = request.getParameter("pag") == null ? 1 : Integer.parseInt(request.getParameter("pag")); 
//		int pageSize = 5;
//		int totRecCnt = dao.totRecCnt();
//		int totPage = (totRecCnt % pageSize) == 0 ? totRecCnt / pageSize : (totRecCnt / pageSize) + 1;
//		int startIndexNo = (pag - 1) * pageSize;
//		int curScrStartNo = totRecCnt - startIndexNo;
//		
//		int blockSize = 3;
//		int curBlock = (pag - 1) / blockSize;
//		int lastBlock = (totPage % blockSize) == 0 ? (totPage / blockSize) - 1 : (totPage / blockSize);
//		
//		ArrayList<UserDAO> vos = dao.getGuestList(startIndexNo, pageSize);
//		
//		request.setAttribute("vos", vos); //request에 담기(웹서버에 올라감)
//		request.setAttribute("curScrStartNo", curScrStartNo);
//		request.setAttribute("pag", pag);
//		request.setAttribute("totPage", totPage);
//		request.setAttribute("blockSize", blockSize);
//		request.setAttribute("curBlock", curBlock);
//		request.setAttribute("lastBlock", lastBlock);
//
//	}

}
