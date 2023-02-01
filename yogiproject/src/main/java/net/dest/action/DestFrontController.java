package net.dest.action;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


@WebServlet("*.de")
public class DestFrontController extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException{
		String RequestURI=request.getRequestURI();
		String contextPath=request.getContextPath();
		String command=RequestURI.substring(contextPath.length());
		ActionForward forward=null;
		Action action=null;
		
		if(command.equals("/GetDestinationList.de")) { //여행지 리스트 불러오기
			request.setCharacterEncoding("utf-8");
			System.out.println(request.getParameter("keyword"));
			forward=new ActionForward();
			forward.setRedirect(false);
			
		}else if(command.equals("/GetDestDetailView.de")) { //여행지 상세 조회 페이지
			request.setCharacterEncoding("utf-8");
			System.out.println(request.getParameter("test"));
			forward=new ActionForward();
			forward.setRedirect(true); //나중에는 false로
			forward.setPath("./search/TravelView.jsp");
		}
		
		if(forward!=null) {
			if(forward.isRedirect()) {
				response.sendRedirect(forward.getPath());
			}
		}
	}
	
	
	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		service(request, response);
	}
	
	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		service(request, response);
	}

}
