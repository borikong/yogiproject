package mem.action;

import java.io.IOException;
import java.util.Vector;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import mem.control.Action;
import mem.control.ActionForward;
import mem.model.MemberDAO;
import mem.model.MemberVO;

public class SearchId implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws IOException {

		request.setCharacterEncoding("utf-8");
		MemberDAO dao = MemberDAO.getInstance();
		
		String name = request.getParameter("name");
		String email = request.getParameter("email");
		
		String id = dao.searchId(name, email);
		request.setAttribute("id", id);
		
		if(id == null) {
			return new ActionForward("mem.do?cmd=searchid", false);
		}
			
		return new ActionForward("searchidProc.jsp", false);
	}

}
