package net.chat.action;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.annotation.*;

import net.member.action.Action;
import net.member.action.ActionForward;
import net.member.action.MemberDeleteAction;
import net.member.action.MemberJoinAction;
import net.member.action.MemberFindAction;
import net.member.action.MemberLoginAction;
import net.member.action.MemberIDCheckAction;

/**
 * Servlet implementation class ChatFrontController
 */

@WebServlet(description="Chat Front Controller", urlPatterns= {"*.ch"})
public class ChatFrontController extends HttpServlet {

	private static final long serialVersionUID = 1L;
       
    public ChatFrontController() {
        super();
    }

    protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String RequestURI=request.getRequestURI();
		String contextPath=request.getContextPath();
		String command=RequestURI.substring(contextPath.length());
		ActionForward forward=null;
		Action action=null;
		
		if(command.equals("/IndexPage.ch")){ //1. index������ ������
			forward=new ActionForward();
			forward.setRedirect(false);
			forward.setPath("./index.jsp");
		}else if(command.equals("/ChatPage.ch")) { //2. ä�� ������ ������
			forward=new ActionForward();
			forward.setRedirect(false);
			forward.setPath("./chat.jsp");
		}else if(command.equals("/sidebar/IndexPage.ch")) {//3. �޴���(sidebar)���� �ε��� ������ ������ ��û�ϴ� ���
			forward=new ActionForward();
			forward.setRedirect(true);
			//forward.setPath("http://localhost:8080/drmeong_180622/index.jsp"); //���� ���(index)
			forward.setPath("http://drmeong624.azurewebsites.net/index.jsp"); //������Ʈ ���
		}
		
		
		if(forward.isRedirect()) {
			response.sendRedirect(forward.getPath());
		}else {
			RequestDispatcher dispatcher= request.getRequestDispatcher(forward.getPath());
			dispatcher.forward(request, response);
		}
	}


}
