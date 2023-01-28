package net.member.action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

public class MemberLogoutAction implements Action{

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
	
		ActionForward forward=new ActionForward();
		HttpSession session=request.getSession();
		String id=(String)session.getAttribute("id"); 
		
		if(id==null) {
			forward.setRedirect(true);
			//forward.setPath("http://localhost:8080/drmeong_180622/member/login_form.jsp");
			forward.setPath("http://drmeong624.azurewebsites.net/member/login_form.jsp");
			return forward;
		}
		
		session.invalidate();
		forward.setRedirect(true);
		//forward.setPath("http://localhost:8080/drmeong_180622/index.jsp"); //일반사용자페이지로 포워딩
		forward.setPath("http://drmeong624.azurewebsites.net/index.jsp");
		return forward;

	}

}
