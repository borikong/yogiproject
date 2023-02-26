package net.dest.action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import net.dest.controller.*;
import net.member.db.MemberDAO;

public class LikeAction implements Action{

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		request.setCharacterEncoding("utf-8");
		ActionForward forward = new ActionForward();
		String loginID=(String)request.getSession().getAttribute("loginID");
		int mode=0; //0: 좋아요 표시 가능, 1: 로그인 하지 않음
		
		if(loginID==null) {
			//로그인하고 찜해보세요 추가
			mode=1;
		}
			
		MemberDAO dao=MemberDAO.getInstance();
		
		String cmd=request.getParameter("cmd");
		int result=0;
		if(cmd.equals("like")) {
			result=dao.addLike(loginID, request.getParameter("dest"));
		}else {
			result=dao.deleteLike(loginID, request.getParameter("dest"));
		}
		
		
		if(result==0) {
			System.out.println("업데이트 실패");
		}else System.out.println("업데이트 성공");
		
		request.setAttribute("thisdest", request.getParameter("dest"));
		
		String page=request.getParameter("page");
		if(page.equals("search")) {
			forward.setPath("Index.de");			
		}else {
			forward.setPath("GetDestDetailView.de?dest_name="+request.getParameter("dest"));
		}
			
		
		
		forward.setRedirect(true);
		return forward;
	}

}
