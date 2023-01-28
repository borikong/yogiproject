package net.member.action;

import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


import net.member.db.MemberBean;
import net.member.db.MemberDAO;

public class MemberFindAction implements Action{

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		request.setCharacterEncoding("UTF_8");
		ActionForward forward=new ActionForward();
		MemberDAO memberdao=new MemberDAO();
		MemberBean member=new MemberBean();
		
		//�̸��� �̸��Ϸ� ȸ������ ã�°�
		String name=request.getParameter("MEMBER_NAME");
		String email=request.getParameter("MEMBER_EMAIL");
		
		member=memberdao.findId(name, email);
		
		//member��ü�� null�� �ƴ϶�� ���� ȸ�� ���̵�� ��й�ȣ�� �˻��Ǿ��ٴ� �ǹ��̹Ƿ� ������ ��ü�� request�� ����
		if(member!=null) { 
			request.setAttribute("id",member.getMEMBER_ID());
			request.setAttribute("password", member.getMEMBER_PW());
			
			forward.setRedirect(false);
			forward.setPath("./member/member_find_ok.jsp");
			return forward;
		}else {
			response.setCharacterEncoding("UTF-8");
			response.setContentType("text/html; chatset=UTF-8");
			PrintWriter out=response.getWriter();
			out.println("<script>");
			out.println("alert('�Է��� ������ ��ġ���� �ʽ��ϴ�.');");
			out.println("history.go(-1)");
			out.println("</script>");
			out.close();
		}
		
		return forward;
	}

}
