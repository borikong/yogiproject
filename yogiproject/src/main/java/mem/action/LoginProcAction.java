package mem.action;

import java.io.IOException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import mem.control.Action;
import mem.control.ActionForward;
import mem.model.MemberDAO;

public class LoginProcAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws IOException {

		request.setCharacterEncoding("utf-8");
		MemberDAO dao = MemberDAO.getInstance();
		
		String id = request.getParameter("id");
		String pass = request.getParameter("pass");
		int check = dao.loginCheck(id, pass);
		
		if(check == 1) { // 로그인 성공 경우
			
			HttpSession session = request.getSession();
			session.setAttribute("loginID", id); // 키, 값
			
		}else if(id != null && pass !=null) {
			request.setAttribute("check", check);
		}
		
		return new ActionForward("mem.do?cmd=login", false);
	}

}
