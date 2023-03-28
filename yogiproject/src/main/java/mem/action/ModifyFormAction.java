package mem.action;

import java.io.IOException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import mem.control.Action;
import mem.control.ActionForward;
import mem.model.MemberDAO;
import mem.model.MemberVO;

public class ModifyFormAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws IOException {

		request.setCharacterEncoding("utf-8");
		MemberDAO dao = MemberDAO.getInstance();
		
		HttpSession session = request.getSession();
		String loginID = (String)session.getAttribute("loginID");
		MemberVO vo = dao.getMember(loginID); // db정보 호출
		
		request.setAttribute("id", vo.getId());
		request.setAttribute("pass", vo.getPass());
		request.setAttribute("name", vo.getName());
		request.setAttribute("email", vo.getEmail());
		request.setAttribute("phone", vo.getPhone());
		request.setAttribute("zipcode", vo.getZipcode());
		request.setAttribute("address1", vo.getAddress1());
		request.setAttribute("address2", vo.getAddress2());
		
		return new ActionForward("/mem/modifyForm.jsp", false);
	}

}
