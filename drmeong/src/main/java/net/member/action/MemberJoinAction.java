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
		
		//����� ���� �Է�
		
		//���̵�
		dto.setMEMBER_ID(request.getParameter("MEMBER_ID"));
		//��й�ȣ
		dto.setMEMBER_PW(request.getParameter("MEMBER_PW"));
		//�̸�
		dto.setMEMBER_NAME(request.getParameter("MEMBER_NAME"));
		//����
		dto.setMEMBER_AGE(Integer.parseInt(request.getParameter("MEMBER_AGE")));
		//����
		dto.setMEMBER_GENDER(request.getParameter("MEMBER_GENDER"));
		//�̸���
		dto.setMEMBER_EMAIL(request.getParameter("MEMBER_EMAIL"));
		
		dto.setMEMBER_ADMIN(0); //1�̸� ������ 0�̸� �⺻ȸ��
		
		memberdao.insertMember(dto);
		
		//������ ���� �Է�
		
		dog_dto.setMEMBER_ID(request.getParameter("MEMBER_ID"));
		System.out.println("������ ���̵�");
		dog_dto.setDOG_NAME("");
		dog_dto.setDOG_BREED("");
		dog_dto.setDOG_SEX("");
		dogdao.insertDog(dog_dto);
		
		forward=new ActionForward();
		forward.setPath("http://drmeong624.azurewebsites.net/member/login_form.jsp"); 
		//forward.setPath("http://localhost:8080/drmeong_180511/member/login_form.jsp");
		
		
		//ȸ�����Կ� �����Ͽ��ٴ� �޽����� ����ϰ� �α��� �������� �̵���Ŵ
		response.setCharacterEncoding("UTF-8");
		response.setContentType("text/html; chatset=UTF-8");
		PrintWriter out=response.getWriter();
		out.println("<script>");
		out.println("alert('ȸ�������� �Ϸ�Ǿ����ϴ�!');");
		//out.println("location.href='http://localhost:8080/drmeong_180622/member/login_form.jsp';"); //MemberFrontController�� MemberLogin�ΰ�
		out.println("location.href='http://drmeong624.azurewebsites.net/member/login_form.jsp';");
		out.println("</script>");
		out.close();
		
		return forward;
	}

}
