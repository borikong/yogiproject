package net.dest.action;


import java.util.ArrayList;
import java.util.Collections;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;
import java.util.Vector;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import mem.model.MemberDAO;
import net.dest.controller.*;
import net.dest.db.DestDAO;
import net.dest.db.DestVO;

public class Index implements Action{

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		request.setCharacterEncoding("utf-8");
		String loginID=(String)request.getSession().getAttribute("loginID");
//		request.getSession().setAttribute("loginID", "test");
		ActionForward forward=new ActionForward();
		//인기 여행지 불러오기
		DestDAO dao=DestDAO.getInstance();
		Vector<DestVO> destlist=dao.getDestList("");
		Map<String, String> maplist=new HashMap<>();
		List<String> sortedlist=null;
		List<DestVO> poplist=new ArrayList<>();
		//이름, 사진, cnt
		if(destlist!=null) {
			//여행지 이름과 cnt를 정렬하기 위해 map에 put
			for (DestVO destVO : destlist) {
				if(destVO.getDEST_CNT()>0) {
					maplist.put(destVO.getDEST_CNT()+ " "+destVO.getDEST_NAME(), destVO.getDEST_NAME());					
				}
			}
			
			
			if(maplist.size()>0) {//cnt>0인 여행지가 하나라도 존재한다면	
				sortedlist=new ArrayList<>(maplist.keySet()); //오름차순 정렬
				Collections.sort(sortedlist,Collections.reverseOrder()); //내림차순 정렬
				
				for (String string : sortedlist) { //각 여행지 정보를 가져와서 vector에 담는다.
					poplist.add(dao.getDest(maplist.get(string)));
				}
				
			}			
		}
		
		if(poplist.size()>8) {
			poplist=poplist.subList(0, 8);	
		}

	
		request.setAttribute("poplist", poplist);
		
		forward.setPath("/Index.jsp");
		forward.setRedirect(false);
		
		return forward;
	}

}
