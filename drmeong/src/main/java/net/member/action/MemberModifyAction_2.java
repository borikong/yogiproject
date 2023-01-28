package net.member.action;

import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import net.member.db.MemberBean;
import net.member.db.MemberDAO;

public class MemberModifyAction_2 implements Action{

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		request.setCharacterEncoding("UTF-8");
		
		MemberDAO memberdao=new MemberDAO();
		MemberBean dto=new MemberBean();
		ActionForward forward=null;
		String pass=request.getParameter("MEMBER_PW");
		HttpSession session=request.getSession();
		String id=(String)session.getAttribute("id");
			
		int check=memberdao.userCheck(id, pass);
		

		/*HttpSession session=request.getSession();
		String id=(String)session.getAttribute("id"); //session�� ����� id�� �����
		
		if(id==null) {
			forward.setRedirect(true);
			forward.setPath("./MemberLogin.me");
			return forward;
		}*/

		
		if(check==1){ //��й�ȣ�� ����� �Է� ������
			dto.setMEMBER_ID(id);
			dto.setMEMBER_PW(request.getParameter("MEMBER_PW"));
			dto.setMEMBER_NAME(request.getParameter("MEMBER_NAME"));
			dto.setMEMBER_AGE(Integer.parseInt(request.getParameter("MEMBER_AGE")));
			dto.setMEMBER_GENDER(request.getParameter("MEMBER_GENDER"));
			dto.setMEMBER_EMAIL(request.getParameter("MEMBER_EMAIL"));
			
			
			memberdao.updateMember(dto);
			response.setCharacterEncoding("UTF-8");
			response.setContentType("text/html; chatset=UTF-8");
			PrintWriter out=response.getWriter();
			out.println("<script>");
			out.println("alert('ȸ�������� �����Ǿ����ϴ�!');");
			//out.println("location.href='http://localhost:8080/drmeong_180622/sidebar/mypage/mypage.jsp';"); 
			out.println("location.href='http://drmeong624.azurewebsites.net/sidebar/mypage/mypage.jsp';"); 
			out.println("</script>");
		
			return forward;
			
		}else{
			response.setCharacterEncoding("UTF-8");
			response.setContentType("text/html; chatset=UTF-8");
			PrintWriter out=response.getWriter();
			out.println("<script>");
			out.println("alert('��й�ȣ�� �ùٸ��� �Է��� �ּ���!');");
			//out.println("location.href='http://localhost:8080/drmeong_180622/sidebar/mypage/mypage.jsp';"); 
			out.println("location.href='http://drmeong624.azurewebsites.net/sidebar/mypage/mypage.jsp';"); 
			out.println("</script>");
			
			
			return forward;
		}
		
	}

}
