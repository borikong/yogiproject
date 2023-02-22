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
		
		String keyword=request.getParameter("keyword");
		DestDAO dao=DestDAO.getInstance();
		//키워드로 여행지 리스트 불러오기, 키워드가 없으면 "" 문자열
		if(keyword==null) {
			keyword="";
		}
		
		//여행지 리스트 불러오기
		Vector<DestVO> destlist=dao.getDestList(keyword);
		request.setAttribute("destlist", destlist);
		
		//우선순위 설정
		int money_pri=0;
		int land_pri=0;
		int fun_pri=0;
		
		if(request.getAttribute("money_pri")!=null&&request.getAttribute("land_pri")!=null&&request.getAttribute("fun_pri")!=null){
			request.setAttribute("money_pri", request.getAttribute("money_pri"));
			request.setAttribute("land_pri", request.getAttribute("land_pri"));
			request.setAttribute("fun_pri", request.getAttribute("fun_pri"));
		}
		

		forward.setPath("Search_main.jsp");
		forward.setRedirect(true);

		return forward;
	}

}
