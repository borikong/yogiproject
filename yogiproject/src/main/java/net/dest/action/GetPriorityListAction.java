package net.dest.action;

import java.util.Vector;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import net.dest.db.DestDAO;
import net.dest.db.DestVO;

public class GetPriorityListAction implements Action{

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		request.setCharacterEncoding("utf-8");
		System.out.println("GetPriorityListAction");
		ActionForward forward=new ActionForward();
		//우선순위가 null로 넘어오는 경우도 구현해야 함
		
		int attribute_num=3; // 속성 개수
		
		//가중치 계산
		float money_weight=calWeight(Integer.parseInt(request.getParameter("money")), attribute_num);
		float land_weight=calWeight(Integer.parseInt(request.getParameter("landscape")), attribute_num);
		float fun_weight=calWeight(Integer.parseInt(request.getParameter("fun")), attribute_num);
		
//		System.out.println("money weight:"+money_weight);
//		System.out.println("land weight:"+land_weight);
//		System.out.println("fun weight:"+fun_weight);
//		
		
		DestDAO dao=DestDAO.getInstance();
		Vector<DestVO> list=dao.getDestList(""); //모든 리스트를 가져옴
		//Vector<DestVO> sortedlist=new Vector<>(); //정렬된 리스트를 담아줄 vector
		
		//가중치 점수 곱한 벡터 만들어주기
		for(int i=0;i<list.size();i++) {
			float origin_money=list.get(i).getDEST_MONEY();
			float origin_land=list.get(i).getDEST_LANDSCAPE();
			float origin_fun=list.get(i).getDEST_FUN();
			float total=origin_money*money_weight+origin_land*land_weight+origin_fun*fun_weight;
			list.get(i).setDEST_TOTAL(total);
		}
		
		//정렬
		for(int i=0;i<list.size();i++) {
			for(int j=0;j<list.size()-i-1;j++) {
				if(list.get(j).getDEST_TOTAL()<list.get(j+1).getDEST_TOTAL()) {
					DestVO vo=list.get(j);
					list.set(j, list.get(j+1));
					list.set(j+1, vo);
				}
			}
		}
		
		request.setAttribute("destList", list);
		request.setAttribute("money_pri", Integer.parseInt(request.getParameter("money")));
		request.setAttribute("land_pri", Integer.parseInt(request.getParameter("landscape")));
		request.setAttribute("fun_pri", Integer.parseInt(request.getParameter("fun")));
			
		forward.setPath("Search_main.jsp");
		forward.setRequest(request); //request 객체 넘겨주기
		forward.setRedirect(true);

		
		return forward;
	}

	//우선순위 가중치 계산
	private float calWeight(int priority, int attnum) {
		float weight=0;
		for(int k=priority; k<=attnum;k++) {
			weight+=1/(float)k;
		}
		return weight*(1/(float)attnum);
	}
}
