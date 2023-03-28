package mem.action;

import java.io.IOException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import mem.control.Action;
import mem.control.ActionForward;
import mem.model.MemberDAO;
import mem.model.MemberVO;

public class MypageAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws IOException {
		
		request.setCharacterEncoding("utf-8");
		
		HttpSession session = request.getSession();
		String loginID = (String)session.getAttribute("loginID");
		
		if(loginID==null) {
			return new ActionForward("/mem/login.jsp", false);
		}else {
			MemberDAO dao = MemberDAO.getInstance();
			MemberVO vo = new MemberVO(
				loginID, 
				request.getParameter("pass"), 
				request.getParameter("name"), 
				request.getParameter("email"), 
				request.getParameter("phone"), 
				request.getParameter("zipcode"), 
				request.getParameter("address1"),
				request.getParameter("address2"),
				request.getParameter("userlike")
			);
			
			return new ActionForward("/mem/mypage.jsp", false);
		}
			
	}

}
