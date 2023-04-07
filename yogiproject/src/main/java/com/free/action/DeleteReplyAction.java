package com.free.action;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.free.controller.Action;
import com.free.controller.ActionForward;
import com.free.model.Free_BoardDAO;

public class DeleteReplyAction implements Action{

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws IOException {
		request.setCharacterEncoding("UTF-8");
		int no = Integer.parseInt(request.getParameter("no"));
		int pageNo =Integer.parseInt(request.getParameter("pageNo"));
		
		request.setAttribute("no", no);
		request.setAttribute("pageNo", pageNo);
		
		Free_BoardDAO fdao=Free_BoardDAO.getInstance();
		
		int result=fdao.deleteReply(Integer.parseInt(request.getParameter("cno")));
		
		if(result==0) {
			response.setCharacterEncoding("UTF-8");
			response.setContentType("text/html; chatset=UTF-8");
			PrintWriter out = response.getWriter();
			out.println("<script>");
			out.println("alert('댓글 삭제 실패했습니다.');");
			out.println("</script>");
			out.close();
			return new ActionForward("Free_Board.do?free=content&no="+no+"&pageNo="+pageNo);
		}
		
		return new ActionForward("Free_Board.do?free=content&no="+no+"&pageNo="+pageNo);
	}

}
