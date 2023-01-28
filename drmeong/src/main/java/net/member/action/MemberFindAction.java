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
		
		//이름과 이메일로 회원정보 찾는겅
		String name=request.getParameter("MEMBER_NAME");
		String email=request.getParameter("MEMBER_EMAIL");
		
		member=memberdao.findId(name, email);
		
		//member객체가 null이 아니라는 것은 회원 아이디와 비밀번호가 검색되었다는 의미이므로 가져온 객체를 request에 저장
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
			out.println("alert('입력한 정보가 일치하지 않습니다.');");
			out.println("history.go(-1)");
			out.println("</script>");
			out.close();
		}
		
		return forward;
	}

}
