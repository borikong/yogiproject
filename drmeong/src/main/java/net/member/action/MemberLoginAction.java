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
			
			if(memberdao.isAdmin(id)) { //관리자일 경우
				forward.setRedirect(true);
				forward.setPath("./IndexPage.ch"); //관리자페이지로 포워딩
				return forward;
			}else { // 일반 사용자일 경우
				forward.setRedirect(true);
				forward.setPath("./IndexPage.ch"); //일반사용자페이지로 포워딩
				return forward;
			}
		}else if(check==0) { //비밀번호가 틀렸을 경우 이전 페이지로 이동
			response.setCharacterEncoding("UTF-8");
			response.setContentType("text/html; chatset=UTF-8");
			PrintWriter out=response.getWriter();
			out.println("<script>");
			out.println("alert('비밀번호가 일치하지 않습니다.');");
			//out.println("location.href='http://localhost:8080/drmeong_180622/member/login_form.jsp';"); 
			out.println("location.href='http://drmeong624.azurewebsites.net/member/login_form.jsp';"); 
			out.println("</script>");
			out.close();
			
			forward.setRedirect(true);
			forward.setPath("./IndexPage.ch");
			System.out.println("indexpage로 포워딩하기 직전");
			return forward;
			
		}else { // 아이디가 존재하지 않을 경우 이전페이지로
			response.setCharacterEncoding("UTF-8");
			response.setContentType("text/html; chatset=UTF-8");
			PrintWriter out=response.getWriter();
			out.println("<script>");
			out.println("alert('ID가 존재하지 않습니다.');");
			//out.println("location.href='http://localhost:8080/drmeong_180622/member/login_form.jsp';"); 
			out.println("location.href='http://drmeong624.azurewebsites.net/member/login_form.jsp';"); 
			out.println("</script>");
			out.close();
		}
		
		
		return null;
	}
	
	
}
