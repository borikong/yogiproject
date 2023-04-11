package net.dest.action;

import java.util.Vector;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import mem.model.MemberDAO;
import net.dest.controller.*;
import net.dest.db.DestDAO;
import net.dest.db.DestVO;

public class LikeAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		request.setCharacterEncoding("utf-8");
		ActionForward forward = new ActionForward();
		String loginID = (String) request.getSession().getAttribute("loginID");
		int mode = 0; // 0: 좋아요 표시 가능, 1: 로그인 하지 않음
		boolean primode = false; // 우선순위 설정 모드 true:설정됨
		String page = request.getParameter("page");

		if (loginID == null) {
			// 로그인하고 찜해보세요 추가
			mode = 1;
		}

		MemberDAO dao = MemberDAO.getInstance();
		DestDAO ddao = DestDAO.getInstance();

		String cmd = request.getParameter("cmd");
		int result = 0;
		String destname = request.getParameter("dest");

		if (cmd.equals("like")) { // 좋아요
			// 반드시 addLike보다 updateCnt 함수가 먼저 호출되어야 함
			ddao.updateCnt("like", destname, loginID); // 해당 여행지의 찜 cnt 증가
			result = dao.addLike(loginID, destname); // 사용자의 좋아요 목록에 추가
		} else {
			ddao.updateCnt("dislike", destname, loginID);
			result = dao.deleteLike(loginID, destname);
		}

		if (result == 0) {
			System.out.println("업데이트 실패");
		} else
			System.out.println("업데이트 성공");

		// thisdest 위치로 html 스크롤
		request.setAttribute("thisdest", request.getParameter("dest"));

		// 찜한 여행지 가져오기
		request.setAttribute("likeList", getLikeList(loginID));

		// 우선순위가 설정되어 있는 경우
		String money_pri = request.getParameter("money");
		String landscape_pri = request.getParameter("landscape");
		String fun_pri = request.getParameter("fun");

		// 우선순위 3가지 전부 설정해 주었을 때
		if (money_pri != null && !money_pri.equals("-") && landscape_pri != null && !landscape_pri.equals("-")
				&& fun_pri != null && !fun_pri.equals("-")) {
			primode = true;
			int attribute_num = 3; // 속성 개수

			// 가중치 계산
			float money_weight = calWeight(Integer.parseInt(money_pri), attribute_num);
			float land_weight = calWeight(Integer.parseInt(landscape_pri), attribute_num);
			float fun_weight = calWeight(Integer.parseInt(fun_pri), attribute_num);

			Vector<DestVO> destlist = ddao.getDestList(""); // 모든 리스트를 가져옴

			// 가중치 점수 곱한 벡터 만들어주기
			for (int i = 0; i < destlist.size(); i++) {
				// money 속성의 경우 점수가 낮을수록 좋기 때문에 숫자를 역으로 바꿔줌
				float origin_money = 1 - destlist.get(i).getDEST_MONEY();
				float origin_land = destlist.get(i).getDEST_LANDSCAPE();
				float origin_fun = destlist.get(i).getDEST_FUN();
				float total = origin_money * money_weight + origin_land * land_weight + origin_fun * fun_weight;
				destlist.get(i).setDEST_TOTAL(total);
			}

			// 정렬
			for (int i = 0; i < destlist.size(); i++) {
				for (int j = 0; j < destlist.size() - i - 1; j++) {
					if (destlist.get(j).getDEST_TOTAL() < destlist.get(j + 1).getDEST_TOTAL()) {
						DestVO vo = destlist.get(j);
						destlist.set(j, destlist.get(j + 1));
						destlist.set(j + 1, vo);
					}
				}
			}

			request.setAttribute("destlist", destlist);
			request.setAttribute("money_pri", Integer.parseInt(money_pri));
			request.setAttribute("land_pri", Integer.parseInt(landscape_pri));
			request.setAttribute("fun_pri", Integer.parseInt(fun_pri));

		}

		

		// 각 페이지별로 좋아요 클릭시 이동 path 설정
		if (page.equals("search")) { // sesarch_main.jsp에서 찜 액션
//			forward.setPath("Index.de");
			if (primode) { // 우선순위 설정 모드인경우
				forward.setRedirect(false);
				forward.setPath("Search_main.jsp");		
			} else { // 우선순위 설정 안되어있는경우 리다이렉트
				forward.setRedirect(false);
				forward.setPath("Index.de");
			}
			

		} else if (page.equals("detail")) {// DetailView.jsp에서 찜 액션
			forward.setPath("GetDestDetailView.de?dest_name=" + request.getParameter("dest"));
			forward.setRedirect(false);
		} else if (page.equals("mypage")) { // 마이페이지에서 찜삭제
			System.out.println("페이지 : " + page);
			String url = request.getContextPath() + "/mem/mem.me?cmd=mypage";
			forward.setRedirect(true);
			forward.setPath(url);
		}

		return forward;
	}

	// 우선순위 가중치 계산(Rank Order Cedtroid)
	private float calWeight(int priority, int attnum) {
		float weight = 0;
		for (int k = priority; k <= attnum; k++) {
			weight += 1 / (float) k;
		}
		return weight * (1 / (float) attnum);
	}
	
	private String[] getLikeList(String loginID) {
		// 찜한 여행지 가져오기
		String[] likeList = { "" };
		if (loginID != null) {
			MemberDAO mdao = MemberDAO.getInstance();
			likeList = mdao.getLikeList(loginID);
		}
		
		return likeList;
	}

}
