package net.dest.action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import net.member.db.MemberDAO;
import net.member.db.MemberVO;

import java.util.ArrayList;
import java.util.Collections;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Vector;

public class GetRecommendListAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		request.setCharacterEncoding("utf-8");
		System.out.println("GetRecommendListAction");
		ActionForward forward = new ActionForward();

		MemberDAO dao = MemberDAO.getInstance();

		Vector<MemberVO> list = dao.getLikeList();

		// target id
		String targetid = "userid";
		// target rating Matrix
		Map<String, Double> target = new HashMap<>();
		// 평가 행렬
		Map<String, Map> ratingMatrix = new HashMap<>();// 사용자id, 평가 행렬 map

		// target의 찜한 여행지를 Map으로 불러오기(찜한 여행지는 무조건 1점)
		for (MemberVO memberVO : list) {
			if (memberVO.getUSER_ID().equals(targetid)) {
				String[] targetlikelist = memberVO.getUSER_LIKE().split(",");
				for (int i = 0; i < targetlikelist.length; i++) {
					target.put(targetlikelist[i], 1.0);
				}
			} else {
				Map<String, Double> element = new HashMap<>();
				String[] targetlikelist = memberVO.getUSER_LIKE().split(",");
				for (int i = 0; i < targetlikelist.length; i++) {
					element.put(targetlikelist[i], 1.0);
				}
				ratingMatrix.put(memberVO.getUSER_ID(), element);
			}

		}

		forward.setPath("Recommend_main.jsp");
		forward.setRedirect(true);
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

	public static void main(String[] args) {

//    	Map<String, Double> target = new HashMap<>();
//    	target.put("후지산", 1.0);
//    	target.put("남산타워", 0.0);
//    	target.put("센소지", 1.0);
//    	
//    	//평가 행렬
//    	Map<String, Map> ratingMatrix=new HashMap<>();//사용자id, 평가 행렬 map
//    	
//    	// 예시를 위한 벡터 초기화
//        Map<String, Double> vector1 = new HashMap<>();
//        vector1.put("후지산", 1.0);
//        vector1.put("남산타워", 1.0);
//        vector1.put("센소지", 0.0);
//        
//        Map<String, Double> vector2 = new HashMap<>();
//        vector2.put("후지산", 1.0);
//        vector2.put("남산타워", 0.0);
//        vector2.put("센소지", 1.0);
//        
//        Map<String, Double> vector3 = new HashMap<>();
//        vector2.put("후지산", 1.0);
//        vector2.put("남산타워", 1.0);
//        vector2.put("센소지", 1.0);
//        
//        ratingMatrix.put("user1",vector1);
//        ratingMatrix.put("user2",vector2);
//        ratingMatrix.put("user3",vector3);
//   

		MemberDAO dao = MemberDAO.getInstance();

		Vector<MemberVO> list = dao.getLikeList();

		// target id
		String targetid = "userid";
		// target rating Matrix
		Map<String, Double> target = new HashMap<>();
		// 평가 행렬
		Map<String, Map> ratingMatrix = new HashMap<>();// 사용자id, 평가 행렬 map

		// target의 찜한 여행지를 Map으로 불러오기(찜한 여행지는 무조건 1점)
		for (MemberVO memberVO : list) {
			if (memberVO.getUSER_ID().equals(targetid)) {
				String[] targetlikelist = memberVO.getUSER_LIKE().split(",");
				for (int i = 0; i < targetlikelist.length; i++) {
					target.put(targetlikelist[i], 1.0);
				}
			} else {
				Map<String, Double> element = new HashMap<>();
				String[] targetlikelist = memberVO.getUSER_LIKE().split(",");
				for (int i = 0; i < targetlikelist.length; i++) {
					element.put(targetlikelist[i], 1.0);
				}
				ratingMatrix.put(memberVO.getUSER_ID(), element);
			}

		}

		// user1에 대한 유사도 행렬
		Map<String, Double> simMatrix = new HashMap<>();

		// 1*n 행렬(target*comparison)
		for (String userid : ratingMatrix.keySet()) {
			double score = cosineSimilarity(target, ratingMatrix.get(userid));
			// 점수 오름차순 정렬을 위해 점수+id로 저장
			simMatrix.put(score + " " + userid, score);
		}

		// sort
		List<String> similarUser = new ArrayList<>(simMatrix.keySet());
		similarUser.sort((s1, s2) -> s1.compareTo(s2));

		// 뒤집기
		Collections.reverse(similarUser);

		for (String key : similarUser) {
			System.out.println("key : " + key + ",  value : " + simMatrix.get(key));
		}

	}// end Main

}
