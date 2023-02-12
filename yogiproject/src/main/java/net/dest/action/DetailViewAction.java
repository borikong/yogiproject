package net.dest.action;

import java.util.Vector;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import net.dest.db.DestDAO;
import net.dest.db.DestVO;

public class DetailViewAction implements Action{

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		request.setCharacterEncoding("utf-8");
		ActionForward forward=new ActionForward();
		String dest_name=request.getParameter("dest_name");
		System.out.println("DetailViewAction : "+dest_name);
		
		if(dest_name==null||dest_name.equals("")) {
			forward.setPath("index.jsp");
			forward.setRequest(request);
			forward.setRedirect(true);
		}else {
			DestDAO dao=DestDAO.getInstance();
			Vector<DestVO> list=dao.getDestList(dest_name);
			request.setAttribute("dest", list.get(0));
			forward.setPath("./search/DetailView.jsp");
			forward.setRequest(request); //request 객체 넘겨주기
			forward.setRedirect(true);
		}
		
		return forward;
	}

}
