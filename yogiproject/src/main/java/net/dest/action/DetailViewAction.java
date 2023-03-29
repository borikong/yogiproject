package net.dest.action;

import java.util.Iterator;
import java.util.List;
import java.util.Vector;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import mem.model.MemberDAO;
import net.dest.controller.*;
import net.dest.db.DestDAO;
import net.dest.db.DestVO;

public class DetailViewAction implements Action{

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		request.setCharacterEncoding("utf-8");
		ActionForward forward=new ActionForward();
		String dest_name=request.getParameter("dest_name");
		System.out.println("DetailViewAction : "+dest_name);
		
		String loginID=(String)request.getSession().getAttribute("loginID");
		if(loginID==null) {
			loginID="익명의 사용자";
		}
		
		if(dest_name==null||dest_name.equals("")) {
			forward.setPath("index.jsp");
			forward.setRedirect(false);
		}else { //받아온 dest_name이 있으면
			DestDAO dao=DestDAO.getInstance();
			Vector<DestVO> list=dao.getDestList(dest_name);
			
			DestVO vo=list.get(0);
			String str="";
			
			//태그 변환(, 구분자로 분리한 후 앞에 # 붙여줌)
			String[] taglist=vo.getDEST_TAG().split(",");
			
			for(int i=0;i<taglist.length;i++) {
				str+="#"+taglist[i].replace(" ","")+" ";
			}
			vo.setDEST_TAG(str);
			
			//찜한 여행지 가져오기
			String[] likeList= {""};
			if(loginID!=null) {
				MemberDAO mdao=MemberDAO.getInstance();
				likeList=mdao.getLikeList(loginID);
			}
			
			request.setAttribute("likeList", likeList);
			
			request.setAttribute("vo", vo);
			forward.setPath("./search/DetailView.jsp");
			forward.setRedirect(false);
		}
		
		return forward;
	}

}
