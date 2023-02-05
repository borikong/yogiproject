package net.dest.action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class GetPriorityListAction implements Action{

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		request.setCharacterEncoding("utf-8");
		System.out.println(request.getParameter("money"));
		System.out.println(request.getParameter("landscape"));
		System.out.println(request.getParameter("fun"));
		return null;
	}

}
