package net.dest.action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import mem.model.MemberDAO;
import mem.model.MemberVO;
import net.dest.controller.*;
import net.dest.db.DestDAO;
import net.dest.db.DestVO;

import java.util.ArrayList;
import java.util.Collections;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;
import java.util.Vector;

public class GetRecommendListAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		request.setCharacterEncoding("utf-8");
		System.out.println("GetRecommendListAction");
		
		ActionForward forward = new ActionForward();
		String loginID=(String)request.getSession().getAttribute("loginID");
				
		int mode=0; //0: 추천 리스트 있음, 1: 로그인 하지 않음, 2: 찜한 리스트 없음
		
		if(loginID==null) {
			//로그인하고 찜해보세요
			mode=1;
		}else if(MemberDAO.getInstance().getLikeList(loginID)==null){
			//찜한 목록이 없습니다
			mode=2;
		}else {
			MemberDAO dao = MemberDAO.getInstance();

			Vector<MemberVO> list = dao.getLikeList();

			// target id
			String targetid = loginID;
			// target rating Matrix
			Map<String, Double> target = new HashMap<>(); //target userid, target ratingMatrix {"센소지"=1.0, "후지산=1.0...}
			// 평가 행렬
			Map<String, Map> ratingMatrix = new HashMap<>();// 비교 사용자id, 비교 사용자 ratingMatrix

			// target의 찜한 여행지를 Map으로 불러오기(찜한 여행지는 무조건 1점)
			for (MemberVO memberVO : list) {
				
				//target user라면 targetmap에 여행지와 여행지 점수를 담는다.(점수는 무조건 1점)
				if (memberVO.getId().equals(targetid)) {
					String[] targetlikelist = memberVO.getUserlike().split(",");
					for (int i = 0; i < targetlikelist.length; i++) {
						target.put(targetlikelist[i], 1.0);
					}
				} else { //target user가 아니라면(유사한 사용자 후보)
					Map<String, Double> candiuser = new HashMap<>(); //각 유저별로 찜한 목록과 점수 저장 {"센소지"=1.0, "후지산=1.0...}
					if(memberVO.getUserlike()!=null) { //좋아요 한 리스트가 있는 유저라면
						String[] targetlikelist = memberVO.getUserlike().split(","); //"센소지, 후지산..." ->["센소지", "후지산"...]
						for (int i = 0; i < targetlikelist.length; i++) {
							candiuser.put(targetlikelist[i], 1.0); //{"센소지"=1.0, "후지산=1.0...}
						}
						ratingMatrix.put(memberVO.getId(), candiuser); //{"userid02"={"센소지"=1.0, "후지산=1.0...}, ...}
					}
				}
			}

			// user1에 대한 유사도 행렬
			Map<String, Double> simMatrix = new HashMap<>();

			// 1*n 행렬(target*comparison)
			for (String userid : ratingMatrix.keySet()) {
				double score = cosineSimilarity(target, ratingMatrix.get(userid));
				// 점수 오름차순 정렬을 위해 점수+id로 저장
				simMatrix.put(score + " " + userid, score); //{비교user= target과 비교user과의 cosine similarity}
			}

			// sort(오름차순 정렬)
			List<String> similarUsers = new ArrayList<>(simMatrix.keySet()); //key 기준으로 정렬
			Collections.sort(similarUsers,Collections.reverseOrder()); //유사한 사용자를 내림차순으로 정렬
			
			//여기에 상위 몇명의 similarUsers까지 사용할지 슬라이싱 하는 코드 작성
			if(similarUsers.size()>5) {
				similarUsers=similarUsers.subList(0, 5);				
			}

			//많이 나온 여행지 개수 세기
			Map<String, Integer> destlist=new HashMap<>();
			for (String string : similarUsers) {
				String userid=string.split(" ")[1]; //정렬된 similarUser에서 userid맨 빼오기
				for(Object key : ratingMatrix.get(userid).keySet()) {
					if(!key.equals("")) {
						try{
							//키가 이미 destlist에 있을때
							destlist.put((String)key, destlist.get(key)+1);
						}catch(Exception e) {
							//키가 destlist에 없을때 새로 넣어줌(count=1부터)
							destlist.put((String)key, 1);
						}
					}	
				}
				
			}
			
			//destlist의 [frequency+여행지 이름] 문자열로 합쳐진 배열을 만들어줌(정렬을 위해서)
			List<String> sortedList=new ArrayList<>();
			
			for (String string : destlist.keySet()) {
				sortedList.add(destlist.get(string)+","+string); // ,로 구분
			}
			
			//후보지 내림차순 정렬
			Collections.sort(sortedList,Collections.reverseOrder());
			
			ArrayList<String> keywords=new ArrayList<>();

			for (String string:sortedList) {
				System.out.println(string.split(",")[1]+":"+string.split(",")[0]);
				keywords.add(string.split(",")[1]);
			}
		
					
			//후보지 추천 Vector 가져오기
			DestDAO ddao=DestDAO.getInstance();
			Vector<DestVO> volist=ddao.getRecommandList(keywords);
			
			request.setAttribute("volist", volist);
		}
		
		request.setAttribute("mode", mode);

		forward.setPath("Recommend_main.jsp");
		forward.setRedirect(false);
		return forward;
	}

	
	
	// 두 벡터 간의 cosine similarity를 계산하는 메소드
	public static double cosineSimilarity(Map<String, Double> vector1, Map<String, Double> vector2) {
		// 벡터의 길이 계산
		// 분자
		double vector1Magnitude = 0.0;
		for (double value : vector1.values()) {
			vector1Magnitude += value * value;
		}
		vector1Magnitude = Math.sqrt(vector1Magnitude);

		double vector2Magnitude = 0.0;
		for (double value : vector2.values()) {
			vector2Magnitude += value * value;
		}
		vector2Magnitude = Math.sqrt(vector2Magnitude);

		// dot product 계산 내적합 분모
		double dotProduct = 0.0;
		for (String key : vector1.keySet()) {
			if (vector2.containsKey(key)) {
				dotProduct += vector1.get(key) * vector2.get(key);
			}
		}

		// cosine similarity 계산
		double cosineSimilarity;
		if (vector1Magnitude == 0.0 || vector2Magnitude == 0.0) {
			cosineSimilarity = 0.0;
		} else {
			cosineSimilarity = dotProduct / (vector1Magnitude * vector2Magnitude);
		}

		return cosineSimilarity;
	} // end cosineSimilarity

}
