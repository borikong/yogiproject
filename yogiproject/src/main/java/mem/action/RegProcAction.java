package mem.action;

import java.io.IOException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import mem.control.Action;
import mem.control.ActionForward;
import mem.model.MemberDAO;
import mem.model.MemberVO;

public class RegProcAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws IOException {
		
		request.setCharacterEncoding("utf-8");
		MemberDAO dao = MemberDAO.getInstance();
		
		MemberVO vo = new MemberVO(
			request.getParameter("id"),
			request.getParameter("pass"),
			request.getParameter("name"),
			request.getParameter("email"),
			request.getParameter("phone"),
			request.getParameter("zipcode"),
			request.getParameter("address1"), 
			request.getParameter("address2"),
			request.getParameter("userlike")
		);
		
		boolean flag = dao.memberInsert(vo);
		request.setAttribute("flag", flag);
		
		return new ActionForward("/mem/regProc.jsp", false);
	}

}
