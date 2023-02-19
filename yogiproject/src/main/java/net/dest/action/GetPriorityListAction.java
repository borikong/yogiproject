package net.dest.action;

import java.io.PrintWriter;
import java.util.Vector;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import net.dest.db.DestDAO;
import net.dest.db.DestVO;

public class GetPriorityListAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		request.setCharacterEncoding("utf-8");
		System.out.println("GetPriorityListAction");
		ActionForward forward = new ActionForward();
		String money_pri=request.getParameter("money");
		String landscape_pri=request.getParameter("landscape");
		String fun_pri=request.getParameter("fun");
		
		// 우선순위 3가지 전부 설정해 주었을 때
		if (money_pri!=null && !money_pri.equals("-")&&landscape_pri!=null&&!landscape_pri.equals("-")&&fun_pri!=null&&!fun_pri.equals("-")) {
			int attribute_num = 3; // 속성 개수

			// 가중치 계산
			float money_weight = calWeight(Integer.parseInt(money_pri), attribute_num);
			float land_weight = calWeight(Integer.parseInt(landscape_pri), attribute_num);
			float fun_weight = calWeight(Integer.parseInt(fun_pri), attribute_num);

//		System.out.println("money weight:"+money_weight);
//		System.out.println("land weight:"+land_weight);
//		System.out.println("fun weight:"+fun_weight);
//		

			DestDAO dao = DestDAO.getInstance();
			Vector<DestVO> list = dao.getDestList(""); // 모든 리스트를 가져옴
			// Vector<DestVO> sortedlist=new Vector<>(); //정렬된 리스트를 담아줄 vector

			// 가중치 점수 곱한 벡터 만들어주기
			for (int i = 0; i < list.size(); i++) {
				//money 속성의 경우 점수가 낮을수록 좋기 때문에 숫자를 역으로 바꿔줌
				float origin_money = 1-list.get(i).getDEST_MONEY();
				float origin_land = list.get(i).getDEST_LANDSCAPE();
				float origin_fun = list.get(i).getDEST_FUN();
				float total = origin_money * money_weight + origin_land * land_weight + origin_fun * fun_weight;
				list.get(i).setDEST_TOTAL(total);
			}

			// 정렬
			for (int i = 0; i < list.size(); i++) {
				for (int j = 0; j < list.size() - i - 1; j++) {
					if (list.get(j).getDEST_TOTAL() < list.get(j + 1).getDEST_TOTAL()) {
						DestVO vo = list.get(j);
						list.set(j, list.get(j + 1));
						list.set(j + 1, vo);
					}
				}
			}

			request.setAttribute("destList", list);
			request.setAttribute("money_pri", Integer.parseInt(money_pri));
			request.setAttribute("land_pri", Integer.parseInt(landscape_pri));
			request.setAttribute("fun_pri", Integer.parseInt(fun_pri));
			forward.setPath("Search_main.jsp");
			forward.setRequest(request); // request 객체 넘겨주기
			forward.setRedirect(true);
		} else {
			response.setCharacterEncoding("UTF-8");
			response.setContentType("text/html; chatset=UTF-8");
			PrintWriter out = response.getWriter();
			out.println("<script>");
			out.println("alert('우선순위를 전부 선택해 주세요!');");
			out.println("location.href='index.jsp';"); 
			out.println("</script>");
			out.close();
			forward.setRedirect(false);
		}

		

		return forward;
	}

	// 우선순위 가중치 계산
	private float calWeight(int priority, int attnum) { 
		float weight = 0;
		for (int k = priority; k <= attnum; k++) {
			weight += 1 / (float) k;
		}
		return weight * (1 / (float) attnum);
	}

}
