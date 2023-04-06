package mem.action;

import java.io.IOException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import mem.control.Action;
import mem.control.ActionForward;
import mem.model.MemberDAO;

public class EmailCheckAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws IOException {

		// db연결
		MemberDAO dao = MemberDAO.getInstance();
		String email = request.getParameter("email");
		String modify=request.getParameter("modify");
		
		if(modify!=null) { //modifyForm에서 email 중복확인
			boolean check2 = dao.emailCheck(email);
			request.setAttribute("email", email);
			request.setAttribute("check2", check2);
			return new ActionForward("/mem/emailCheck_modify.jsp", false);
		}else {//regForm에서 email 중복확인
			String id=request.getParameter("id");
			String check=request.getParameter("check");
			boolean check2 = dao.emailCheck(email);
			request.setAttribute("id", id);
			request.setAttribute("email", email);
			request.setAttribute("check2", check2);
			request.setAttribute("check", check);
			return new ActionForward("/mem/emailCheck.jsp", false);
		}
		
		
		
	}

}
