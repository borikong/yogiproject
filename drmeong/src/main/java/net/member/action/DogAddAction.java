package net.member.action;


import java.io.PrintWriter;


import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import net.dog.db.DogBean;
import net.dog.db.DogDAO;


@WebServlet("/DogAddAction")
public class DogAddAction extends HttpServlet implements Action {

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
request.setCharacterEncoding("UTF-8");
		
		DogDAO dogdao=new DogDAO();
		DogBean dto=new DogBean();
		ActionForward forward=null;
		HttpSession session=request.getSession();
		String id=(String)session.getAttribute("id");
		
		System.out.println("주인 아이디 "+id);
		
		dto.setMEMBER_ID(id); //주인 아이디
		dto.setDOG_NAME(request.getParameter("DOG_NAME")); //개이름
		dto.setDOG_BYEAR(Integer.parseInt(request.getParameter("DOG_BYEAR"))); //강아지 출생년도
		dto.setDOG_BMONTH(Integer.parseInt(request.getParameter("DOG_BMONTH"))); //강아지 출생 달
		dto.setDOG_BDATE(Integer.parseInt(request.getParameter("DOG_BDATE"))); //강아지 출생 일
		dto.setDOG_AGE(Integer.parseInt(request.getParameter("DOG_AGE"))); //강아지 나이
		dto.setDOG_BREED(request.getParameter("DOG_BREED")); // 견종
		dto.setDOG_SEX(request.getParameter("DOG_SEX")); // 강아지 성별
		dto.setDOG_WEIGHT(Integer.parseInt(request.getParameter("DOG_WEIGHT"))); //강아지 몸무게
		
		dogdao.updateDog(dto);
		
		//개정보 입력 성공 메시지 출력 후 강아지정보 페이지로 이동
		response.setCharacterEncoding("UTF-8");
		response.setContentType("text/html; chatset=UTF-8");
		PrintWriter out=response.getWriter();
		out.println("<script>");
		out.println("alert('강아지 정보가 수정되었습니다!');");
		//out.println("location.href='http://localhost:8080/drmeong_180622/sidebar/mypage/dogpage.jsp';");  //로컬경로
		out.println("location.href='http://drmeong624.azurewebsites.net/sidebar/mypage/dogpage.jsp';"); 
		out.println("</script>");
	
		
		return forward;
	}
       

  

}
