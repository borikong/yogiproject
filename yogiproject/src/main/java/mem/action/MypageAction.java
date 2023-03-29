package mem.action;

import java.io.IOException;
import java.util.LinkedList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import mem.control.Action;
import mem.control.ActionForward;
import mem.model.MemberDAO;
import mem.model.MemberVO;
import net.dest.db.DestDAO;
import net.dest.db.DestVO;

public class MypageAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws IOException {
		
		request.setCharacterEncoding("utf-8");
		
		HttpSession session = request.getSession();
		String loginID = (String)session.getAttribute("loginID");
		
		if(loginID==null) {
			return new ActionForward("/mem/login.jsp", false);
		}else {
			//찜한 여행지 리스트 불러오기
			MemberDAO dao=MemberDAO.getInstance();
			
			String[] likes=dao.getLikeList(loginID); // 좋아요 표시한 여행지명 리스트
			
			
			if(likes!=null) {
				DestDAO ddao=DestDAO.getInstance();
				List<DestVO> likelist=new LinkedList<>();
				for (String string : likes) {
					if(!string.equals("")) {
						likelist.add(ddao.getDest(string));						
					}
				}
				request.setAttribute("likelist", likelist);				
				request.setAttribute("likecheck", 1);
			}else {
				request.setAttribute("likecheck", 0);
			}
			
			
			return new ActionForward("/mem/mypage.jsp", false);
		}
			
	}

}
