package net.member.action;

import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import net.member.db.MemberDAO;

public class MemberDeleteAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		ActionForward forward=new ActionForward();
		HttpSession session=request.getSession();
		String id=(String)session.getAttribute("id"); //session에 저장된 id값 없어옴
		
		if(id==null) {
			forward.setRedirect(true);
			//forward.setPath("http://localhost:8080/drmeong_180622/member/login_form.jsp");
			forward.setPath("http://drmeong624.azurewebsites.net/member/login_form.jsp");
			return forward;
		}
		
		MemberDAO memberdao=new MemberDAO();
		String pass=request.getParameter("MEMBER_PW");
		
		try {
			int check=memberdao.deleteMember(id, pass);
			
			if(check==1) {
				session.invalidate();
				forward.setRedirect(false);
				response.setCharacterEncoding("UTF-8");
				response.setContentType("text/html; chatset=UTF-8");
				PrintWriter out=response.getWriter();
				out.println("<script>");
				out.println("alert('회원정보가 영구적으로 삭제되었습니다.');");
				//out.println("location.href='http://localhost:8080/drmeong_180622/index.jsp';"); 
				out.println("location.href='http://drmeong624.azurewebsites.net/index.jsp';"); 
				out.println("</script>");
				out.close();
				return forward;
			}else {
				response.setContentType("text/html; chatset=UTF-8");
				response.setCharacterEncoding("UTF-8");
				PrintWriter out=response.getWriter();
				forward.setRedirect(false);
				out.println("<script>");
				out.println("alert('비밀번호가 맞지 않습니다.');");
				out.println("history.go(-1)");
				out.println("</script>");
				out.close();
			}
		}catch(Exception e) {
			e.printStackTrace();
		}
		
		return null;
	}

}
