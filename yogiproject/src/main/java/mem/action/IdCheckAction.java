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
		boolean check = dao.idCheck(id);
		request.setAttribute("id", id);
		request.setAttribute("check", check);
		
		return new ActionForward("/mem/idCheck.jsp", false);
	}

}
