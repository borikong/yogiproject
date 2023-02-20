package net.dest.action;

import java.util.Vector;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import net.dest.db.*;

public class GetDestListAction implements Action{

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		request.setCharacterEncoding("utf-8");
		System.out.println("GetDestListAction : "+request.getParameter("keyword"));
		ActionForward forward=new ActionForward();
		
		//String contextPath=request.getContextPath();
		String keyword=request.getParameter("keyword");
		DestDAO dao=DestDAO.getInstance();
		//키워드로 여행지 리스트 불러오기, 키워드가 없으면 "" 문자열
		if(keyword==null) {
			keyword="";
		}
		Vector<DestVO> list=dao.getDestList(keyword);
		
		//불러온 여행지 리스트를 request 객체로 넘겨주기 위해 setAttribute
		request.setAttribute("destList", list);

		forward.setPath("Search_main.jsp");
		//forward.setRequest(request); //request 객체 넘겨주기
		forward.setRedirect(true);

		return forward;
	}

}
