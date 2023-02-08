package net.dest.action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import net.dest.db.DestDAO;
import net.dest.db.DestVO;

public class GetDestListAction implements Action{

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		request.setCharacterEncoding("utf-8");
		System.out.println(request.getParameter("keyword"));
		ActionForward forward=new ActionForward();
		
		String contextPath=request.getContextPath();
		String keyword=request.getParameter("keyword");
//		DestDAO dao=new DestDAO();		
//		
//		dao.getKeywordDest(keyword);
//		
		forward.setPath(contextPath+"/Search_main.jsp");
		forward.setRedirect(true);
		
		return forward;
	}

}
