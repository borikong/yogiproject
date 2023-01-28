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
		
		System.out.println("���� ���̵� "+id);
		
		dto.setMEMBER_ID(id); //���� ���̵�
		dto.setDOG_NAME(request.getParameter("DOG_NAME")); //���̸�
		dto.setDOG_BYEAR(Integer.parseInt(request.getParameter("DOG_BYEAR"))); //������ ����⵵
		dto.setDOG_BMONTH(Integer.parseInt(request.getParameter("DOG_BMONTH"))); //������ ��� ��
		dto.setDOG_BDATE(Integer.parseInt(request.getParameter("DOG_BDATE"))); //������ ��� ��
		dto.setDOG_AGE(Integer.parseInt(request.getParameter("DOG_AGE"))); //������ ����
		dto.setDOG_BREED(request.getParameter("DOG_BREED")); // ����
		dto.setDOG_SEX(request.getParameter("DOG_SEX")); // ������ ����
		dto.setDOG_WEIGHT(Integer.parseInt(request.getParameter("DOG_WEIGHT"))); //������ ������
		
		dogdao.updateDog(dto);
		
		//������ �Է� ���� �޽��� ��� �� ���������� �������� �̵�
		response.setCharacterEncoding("UTF-8");
		response.setContentType("text/html; chatset=UTF-8");
		PrintWriter out=response.getWriter();
		out.println("<script>");
		out.println("alert('������ ������ �����Ǿ����ϴ�!');");
		//out.println("location.href='http://localhost:8080/drmeong_180622/sidebar/mypage/dogpage.jsp';");  //���ð��
		out.println("location.href='http://drmeong624.azurewebsites.net/sidebar/mypage/dogpage.jsp';"); 
		out.println("</script>");
	
		
		return forward;
	}
       

  

}
