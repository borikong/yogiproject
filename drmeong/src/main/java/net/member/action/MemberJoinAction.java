package net.member.action;

import java.io.PrintWriter;
import java.util.Calendar;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import net.dog.db.DogBean;
import net.dog.db.DogDAO;
import net.member.db.MemberBean;
import net.member.db.MemberDAO;

public class MemberJoinAction implements Action{

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		request.setCharacterEncoding("UTF-8");
		System.out.println("2");
		MemberDAO memberdao=new MemberDAO();
		MemberBean dto=new MemberBean();
		
		DogDAO dogdao=new DogDAO();
		DogBean dog_dto=new DogBean();
		
		ActionForward forward=new ActionForward();
		
		//사용자 정보 입력
		
		//아이디
		dto.setMEMBER_ID(request.getParameter("MEMBER_ID"));
		//비밀번호
		dto.setMEMBER_PW(request.getParameter("MEMBER_PW"));
		//이름
		dto.setMEMBER_NAME(request.getParameter("MEMBER_NAME"));
		//나이
		dto.setMEMBER_AGE(Integer.parseInt(request.getParameter("MEMBER_AGE")));
		//성별
		dto.setMEMBER_GENDER(request.getParameter("MEMBER_GENDER"));
		//이메일
		dto.setMEMBER_EMAIL(request.getParameter("MEMBER_EMAIL"));
		
		dto.setMEMBER_ADMIN(0); //1이면 관리자 0이면 기본회원
		
		memberdao.insertMember(dto);
		
		//강아지 정보 입력
		
		dog_dto.setMEMBER_ID(request.getParameter("MEMBER_ID"));
		System.out.println("강아지 아이디");
		dog_dto.setDOG_NAME("");
		dog_dto.setDOG_BREED("");
		dog_dto.setDOG_SEX("");
		dogdao.insertDog(dog_dto);
		
		forward=new ActionForward();
		forward.setPath("http://drmeong624.azurewebsites.net/member/login_form.jsp"); 
		//forward.setPath("http://localhost:8080/drmeong_180511/member/login_form.jsp");
		
		
		//회원가입에 성공하였다는 메시지를 출력하고 로그인 페이지로 이동시킴
		response.setCharacterEncoding("UTF-8");
		response.setContentType("text/html; chatset=UTF-8");
		PrintWriter out=response.getWriter();
		out.println("<script>");
		out.println("alert('회원가입이 완료되었습니다!');");
		//out.println("location.href='http://localhost:8080/drmeong_180622/member/login_form.jsp';"); //MemberFrontController에 MemberLogin인거
		out.println("location.href='http://drmeong624.azurewebsites.net/member/login_form.jsp';");
		out.println("</script>");
		out.close();
		
		return forward;
	}

}
