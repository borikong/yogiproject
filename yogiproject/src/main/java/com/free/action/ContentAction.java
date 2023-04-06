package com.free.action;

import java.io.IOException;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.free.controller.Action;
import com.free.controller.ActionForward;
import com.free.model.Free_BoardDAO;
import com.free.model.Free_BoardVO;

public class ContentAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws IOException {
		
		int no = Integer.parseInt(request.getParameter("no"));
		
		String pageNo = request.getParameter("pageNo");
		
		
		Free_BoardDAO freePro = Free_BoardDAO.getInstance();
		Free_BoardVO free = freePro.getFree(no);
		
		request.setAttribute("no", new Integer(no));
		request.setAttribute("pageNo", new Integer(pageNo));
		request.setAttribute("freevo", free);
		
		//다영
		List<Free_BoardVO> replylist=freePro.replyList(no);
		request.setAttribute("replylist", replylist);
		
		return new ActionForward("Free_Board_Content.jsp");
	}

}
