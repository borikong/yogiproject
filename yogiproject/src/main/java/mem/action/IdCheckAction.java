package mem.action;

import java.io.IOException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import mem.control.Action;
import mem.control.ActionForward;
import mem.model.MemberDAO;

public class IdCheckAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws IOException {

		// db연결
		MemberDAO dao = MemberDAO.getInstance();
		String id = request.getParameter("id");
		String email=request.getParameter("email");
		String check2=request.getParameter("check2");
		boolean check = dao.idCheck(id);
		request.setAttribute("id", id);
		request.setAttribute("email", email);
		request.setAttribute("check", check);
		request.setAttribute("check2", check2);
		
		return new ActionForward("/mem/idCheck.jsp", false);
	}

}
