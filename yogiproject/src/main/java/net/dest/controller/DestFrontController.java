package net.dest.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import net.dest.action.*;


@WebServlet("*.de")
public class DestFrontController extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException{
		String RequestURI=request.getRequestURI();
		String contextPath=request.getContextPath();
		String command=RequestURI.substring(contextPath.length());
		ActionForward forward=null;
		Action action=null;
		
		if(command.equals("/search_main/GetDestinationList.de")) { //Search_main 키워드로 조회
			action=new GetDestListAction();
		}else if(command.equals("/search_main/GetPriorityList.de")) {//Search_main 우선순위로 조회
			action=new GetPriorityListAction();
			
		}else if(command.equals("/search_main/GetDestDetailView.de")) { //여행지 상세 조회 페이지
			action=new DetailViewAction();

		}else if(command.equals("/search_main/RecommandList.de")) { //여행지 추천 리스트 페이지
			action=new GetRecommendListAction();
		}else if(command.equals("/search_main/Like.de")) { //좋아요, 좋아요 취소 누르기
			action=new LikeAction();
		}else if(command.equals("/search_main/Index.de")) { //좋아요, 좋아요 취소 누르기
			action=new IndexAction();
		}
		
		forward=execute(request, response, action);
		if(forward!=null) {
			//redirect
			if(forward.isRedirect()) {
				response.sendRedirect(forward.getPath());
			}else { //forward
				RequestDispatcher dispatcher = request.getRequestDispatcher(forward.getPath());
		        dispatcher.forward(request,response);
			}
		}
	}
	
	private ActionForward execute(HttpServletRequest request, HttpServletResponse response,Action action) {
		ActionForward forward=null;
		if(action!=null) {
			try {
				forward=action.execute(request, response);
			} catch (Exception e) {
				e.printStackTrace();
			}
		}		
		return forward;
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
