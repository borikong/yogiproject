package net.member.action;

import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import net.member.db.MemberDAO;

public class MemberLoginAction implements Action{

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		// TODO Auto-generated method stub
		

		ActionForward forward=new ActionForward();
		
		HttpSession session=request.getSession();
		MemberDAO memberdao=new MemberDAO();
		
		String id=request.getParameter("MEMBER_ID");
		String pass=request.getParameter("MEMBER_PW");
			
		int check=memberdao.userCheck(id, pass);
		
		
		if(check==1) {
			session.setAttribute("id", id);
			
			if(memberdao.isAdmin(id)) { //�������� ���
				forward.setRedirect(true);
				forward.setPath("./IndexPage.ch"); //�������������� ������
				return forward;
			}else { // �Ϲ� ������� ���
				forward.setRedirect(true);
				forward.setPath("./IndexPage.ch"); //�Ϲݻ������������ ������
				return forward;
			}
		}else if(check==0) { //��й�ȣ�� Ʋ���� ��� ���� �������� �̵�
			response.setCharacterEncoding("UTF-8");
			response.setContentType("text/html; chatset=UTF-8");
			PrintWriter out=response.getWriter();
			out.println("<script>");
			out.println("alert('��й�ȣ�� ��ġ���� �ʽ��ϴ�.');");
			//out.println("location.href='http://localhost:8080/drmeong_180622/member/login_form.jsp';"); 
			out.println("location.href='http://drmeong624.azurewebsites.net/member/login_form.jsp';"); 
			out.println("</script>");
			out.close();
			
			forward.setRedirect(true);
			forward.setPath("./IndexPage.ch");
			System.out.println("indexpage�� �������ϱ� ����");
			return forward;
			
		}else { // ���̵� �������� ���� ��� ������������
			response.setCharacterEncoding("UTF-8");
			response.setContentType("text/html; chatset=UTF-8");
			PrintWriter out=response.getWriter();
			out.println("<script>");
			out.println("alert('ID�� �������� �ʽ��ϴ�.');");
			//out.println("location.href='http://localhost:8080/drmeong_180622/member/login_form.jsp';"); 
			out.println("location.href='http://drmeong624.azurewebsites.net/member/login_form.jsp';"); 
			out.println("</script>");
			out.close();
		}
		
		
		return null;
	}
	
	
}
