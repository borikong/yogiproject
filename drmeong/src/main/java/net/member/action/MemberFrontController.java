package net.member.action;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class MemberFrontController
 */
@WebServlet(description = "Member Front Controller", urlPatterns = { "*.me" })
public class MemberFrontController extends HttpServlet implements javax.servlet.Servlet {
	private static final long serialVersionUID = 1L;

	protected void service(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String RequestURI = request.getRequestURI();
		String contextPath = request.getContextPath();
		String command = RequestURI.substring(contextPath.length());
		ActionForward forward = null;
		Action action = null;

		iif (command.equals("/MemberLogin.me")) { // 1. �α���
			forward = new ActionForward();
			forward.setRedirect(false);
			forward.setPath("./member/login_form.jsp");
		} else if (command.equals("/MemberJoin.me")) { // 2. ȸ������	```
			forward = new ActionForward();
			forward.setRedirect(false);
			forward.setPath("./member/join_form.jsp");
		} else if (command.equals("/MemberFind.me")) {// 3. ȸ���˻�
			forward = new ActionForward();
			forward.setRedirect(false);
			forward.setPath("./member/member_find.jsp");
		} else if (command.equals("/MemberOut.me")) {
			forward = new ActionForward();
			forward.setRedirect(false);
			forward.setPath("./member/member_out.jsp"); // 4. ȸ��Ż��
		} else if (command.equals("/MemberLoginAction.me")) { // 5. �α��ξ׼�
			action = new MemberLoginAction();
			try {
				forward = action.execute(request, response);
			} catch (Exception e) {
				e.printStackTrace();
			}
		} else if (command.equals("/MemberJoinAction.me")) { // 6. ���ξ׼�
			action = new MemberJoinAction();
			try {
				forward = action.execute(request, response);
			} catch (Exception e) {
				e.printStackTrace();
			}
		} else if (command.equals("/MemberModifyAction_1.me")) { // 7.ȸ�����������׼�(1)
			action = new MemberModifyAction_1();
			try {
				forward = action.execute(request, response);
			} catch (Exception e) {
				e.printStackTrace();
			}
		} else if (command.equals("/sidebar/mypage/MemberModifyAction_2.me")) { // 8.
																				// ȸ�����������׼�(2)
			action = new MemberModifyAction_2();
			try {
				forward = action.execute(request, response);
			} catch (Exception e) {
				e.printStackTrace();
			}
		} else if (command.equals("/sidebar/mypage/MemberDeleteAction.me")) { // 9. ȸ��Ż��׼�
			action = new MemberDeleteAction();
			try {
				forward = action.execute(request, response);
			} catch (Exception e) {
				e.printStackTrace();
			}
		} else if (command.equals("/MemberIDCheckAction.me")) { // 10. ���̵� �ߺ��˻�
																// �׼�
			action = new MemberIDCheckAction();
			try {
				forward = action.execute(request, response);
			} catch (Exception e) {
				e.printStackTrace();
			}
		} else if (command.equals("/MemberFindAction.me")) { // 11. ȸ���˻� �׼�
			action = new MemberFindAction();
			try {
				forward = action.execute(request, response);
			} catch (Exception e) {
				e.printStackTrace();
			}
		} else if (command.equals("/MemberLogoutAction.me")) { // 12.�α׾ƿ� �׼�
			action = new MemberLogoutAction();

			try {
				forward = action.execute(request, response);
			} catch (Exception e) {
				e.printStackTrace();
			}
		} else if (command.equals("/sidebar/MemberLoginAction.me")) { // 13.
																		// ��������������
																		// �����
																		// ���� �ĺ�
																		// �α����ϴ�
																		// ���
			action = new MemberLoginAction();
			try {
				forward = action.execute(request, response);
			} catch (Exception e) {
				e.printStackTrace();
			}
		} else if (command.equals("/sidebar/mypage/DogAddAction.me")) { // 14.
																		// ������
																		// ���� �߰�
			action = new DogAddAction();
			try {
				forward = action.execute(request, response);
			} catch (Exception e) {
				e.printStackTrace();
			}
		} else if (command.equals("/DogPage.me")) { // 15. ������ ���� ������
			forward = new ActionForward();
			forward.setRedirect(true);
			forward.setPath("http://localhost:8080/drmeong_180622/sidebar/mypage/dogpage.jsp");
		} else if (command.equals("/sidebar/mypage/MemberLogoutAction.me")) { // 16.
																				// ����������->�α׾ƿ�
			action = new MemberLogoutAction();

			try {
				forward = action.execute(request, response);
			} catch (Exception e) {
				e.printStackTrace();
			}
		}

		System.out.println("Ŀ�ǵ�" + command);
		if (forward == null) { //forward�� �������� �ʰ�  response ��ü�� ������ ��� �ƹ��͵� ���� ����(�Ѵ� ������ ��� Exception�߻�)

		} else if (forward.isRedirect()) { //forward.seRedirect(true) forward.setPatn("")������ ���
			response.sendRedirect(forward.getPath());
		} else {
			RequestDispatcher dispatcher = request.getRequestDispatcher(forward.getPath());
			dispatcher.forward(request, response);
		}
	}

}
