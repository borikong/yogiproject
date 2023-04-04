package mem.action;

import java.io.IOException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import mem.control.Action;
import mem.control.ActionForward;
import mem.model.MemberDAO;

public class SearchPass implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws IOException {

		request.setCharacterEncoding("utf-8");
		MemberDAO dao = MemberDAO.getInstance();
		
		String name = request.getParameter("name");
		String email = request.getParameter("email");
		String id = request.getParameter("id");
		
		String pass = dao.searchPass(name, email, id);
		request.setAttribute("pass", pass);
		
		if(id == null) {
			return new ActionForward("mem.do?cmd=searchpass", false);
		}
			
		return new ActionForward("searchpassProc.jsp", false);
	}

}
