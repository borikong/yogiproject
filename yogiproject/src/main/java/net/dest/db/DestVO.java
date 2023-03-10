package net.dest.db;

public class DestVO {
	private String DEST_ID; //여행지 id(식별번호 unique)
	private String DEST_NAME; //여행지 이름
	private String DEST_COUNTRY; //여행지 국가
	private String DEST_NAME_ENG; //여행지 이름 영어
	private String DEST_CONTENT;//여행지 소개글
	private float DEST_MONEY;//여행지 비용 속성 점수
	private float DEST_LANDSCAPE;//여행지 경치 속성 점수
	private float DEST_FUN;//여행지 재미 속성 점수
	private String DEST_TAG; //여행지 태그, 공백으로 분리
	private String DEST_IMG; //여행지 이미지 주소
	private String DEST_MAP; //여행지 구글 지도 주소
	private float DEST_TOTAL; //가중치를 곱한 여행지 점수
	private String DEST_SUMMARY;
	
	
	public String getDEST_ID() {
		return DEST_ID;
	}
	public void setDEST_ID(String dEST_ID) {
		DEST_ID = dEST_ID;
	}
	public String getDEST_NAME() {
		return DEST_NAME;
	}
	public void setDEST_NAME(String dEST_NAME) {
		DEST_NAME = dEST_NAME;
	}
	public String getDEST_COUNTRY() {
		return DEST_COUNTRY;
	}
	public void setDEST_COUNTRY(String dEST_COUNTRY) {
		DEST_COUNTRY = dEST_COUNTRY;
	}
	public String getDEST_NAME_ENG() {
		return DEST_NAME_ENG;
	}
	public void setDEST_NAME_ENG(String dEST_NAME_ENG) {
		DEST_NAME_ENG = dEST_NAME_ENG;
	}
	public String getDEST_CONTENT() {
		return DEST_CONTENT;
	}
	public void setDEST_CONTENT(String dEST_CONTENT) {
		DEST_CONTENT = dEST_CONTENT;
	}
	public float getDEST_MONEY() {
		return DEST_MONEY;
	}
	public void setDEST_MONEY(float dEST_MONEY) {
		DEST_MONEY = dEST_MONEY;
	}
	public float getDEST_LANDSCAPE() {
		return DEST_LANDSCAPE;
	}
	public void setDEST_LANDSCAPE(float dEST_LANDSCAPE) {
		DEST_LANDSCAPE = dEST_LANDSCAPE;
	}
	public float getDEST_FUN() {
		return DEST_FUN;
	}
	public void setDEST_FUN(float dEST_FUN) {
		DEST_FUN = dEST_FUN;
	}
	public String getDEST_TAG() {
		return DEST_TAG;
	}
	public void setDEST_TAG(String dEST_TAG) {
		DEST_TAG = dEST_TAG;
	}
	public String getDEST_IMG() {
		return DEST_IMG;
	}
	public void setDEST_IMG(String dEST_IMG) {
		DEST_IMG = dEST_IMG;
	}
	public String getDEST_MAP() {
		return DEST_MAP;
	}
	public void setDEST_MAP(String dEST_MAP) {
		DEST_MAP = dEST_MAP;
	}
	public float getDEST_TOTAL() {
		return DEST_TOTAL;
	}
	public void setDEST_TOTAL(float dEST_TOTAL) {
		DEST_TOTAL = dEST_TOTAL;
	}
	
	
	public void setDEST_SUMMARY(String dEST_SUMMARY) {
		DEST_SUMMARY = dEST_SUMMARY;
	}
	public String getDEST_SUMMARY() {
		if(getDEST_CONTENT().length()>190){
			return getDEST_CONTENT().substring(0,190);
		}else return getDEST_CONTENT();
	}

	
	
}
