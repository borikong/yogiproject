package net.dest.action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import net.dest.controller.Action;
import net.dest.controller.ActionForward;

public class IndexAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
//		HttpSession session = request.getSession();
//		session.invalidate();
//		String loginID="userid7";
		
		//request.getSession().setAttribute("loginID", loginID);

		//System.out.println("IndexAction : "+loginID);

		//like btn 눌렀을 때 DB처리 하고 다시 그 페이지 그 위치로 돌아오기 위해서
		//thisdest라는 이름의 a 태그 위치로 이동시키기 위해
		if (request.getAttribute("thisdest") == null) {
			request.setAttribute("thisdest", "");
		} else {
			request.setAttribute("thisdest", request.getAttribute("thisdest"));
		}

		request.setAttribute("thisdest", request.getAttribute("thisdest"));

		ActionForward forward = new ActionForward();
		forward.setPath("index.jsp");
		forward.setRedirect(true);
		return forward;
	}

}
