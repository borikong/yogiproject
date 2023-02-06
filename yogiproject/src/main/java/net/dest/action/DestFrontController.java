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
		
		if(command.equals("/GetDestinationList.de")) { //Search_main 키워드로 조회
			action=new GetDestListAction();
			try {
				action.execute(request, response);
			} catch (Exception e) {
				e.printStackTrace();
			}
			forward=new ActionForward();
			forward.setPath(contextPath+"/Search_main.jsp");
			forward.setRedirect(true);
			
		}else if(command.equals("/GetPriorityList.de")) {//Search_main 우선순위로 조회
			action=new GetPriorityListAction();
			try {
				action.execute(request, response);
			} catch (Exception e) {
				e.printStackTrace();
			}
			forward=new ActionForward();
			forward.setPath(contextPath+"/Search_main.jsp");
			forward.setRedirect(true);		
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
