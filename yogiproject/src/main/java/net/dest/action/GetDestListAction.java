package net.dest.action;

import java.util.Vector;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import mem.model.MemberDAO;
import net.dest.controller.*;
import net.dest.db.*;

public class GetDestListAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		request.setCharacterEncoding("utf-8");
		System.out.println("GetDestListAction");
		ActionForward forward = new ActionForward();
		// 세션에 저장된 loginID
		String loginID = (String) request.getSession().getAttribute("loginID");

		// 여행지 키워드, 없으면 "" 문자열
		String keyword = request.getParameter("keyword");
		if (keyword == null) {
			keyword = "";
		}
		

		String condition = request.getParameter("condition");

		// 여행지 리스트 불러오기
		DestDAO dao = DestDAO.getInstance();
		Vector<DestVO> destlist = null;

		//검색 조건이 설정되어 있는 경우
		if(condition!=null) {
			request.setAttribute("condition", condition);
			// 검색 조건에 따라 여행지 리스트 불러오기
			if(condition.equals("나라")) { // 검색조건이 나라인 경우
				destlist = dao.getDestListByCountry(keyword);
				request.setAttribute("destlist", destlist);
			}else { // 검색 조건이 키워드인 경우
				destlist = dao.getDestList(keyword);
				request.setAttribute("destlist", destlist);
			}
		}else {
			destlist = dao.getDestList(keyword);
			request.setAttribute("destlist", destlist);
		}

		// 우선순위 설정(설정된 우선순위가 있다면 그대로 다시 입력해 주기 위해)
		if (request.getAttribute("money_pri") != null && request.getAttribute("land_pri") != null
				&& request.getAttribute("fun_pri") != null) {
			request.setAttribute("money_pri", request.getAttribute("money_pri"));
			request.setAttribute("land_pri", request.getAttribute("land_pri"));
			request.setAttribute("fun_pri", request.getAttribute("fun_pri"));
		}

		// 찜한 여행지 가져오기
		String[] likeList = { "" };
		if (loginID != null) {
			MemberDAO mdao = MemberDAO.getInstance();
			likeList = mdao.getLikeList(loginID);
		}

		request.setAttribute("likeList", likeList);

		/// like btn 눌렀을 때 DB처리 하고 다시 그 페이지 그 위치로 돌아오기 위해서
		// thisdest라는 이름의 a 태그 위치로 이동시킴
		// index.jsp에서 받아온 파라미터값
		if (request.getParameter("thisdest") == null) {
			request.setAttribute("thisdest", "");
		} else {
			request.setAttribute("thisdest", request.getParameter("thisdest"));
		}

		forward.setPath("Search_main.jsp");
		forward.setRedirect(true);

		return forward;
	}

}
