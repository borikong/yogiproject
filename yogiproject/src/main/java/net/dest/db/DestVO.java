package net.dest.db;

public class DestVO {
	private String DEST_ID; //여행지 id(식별번호 unique)
	private String DEST_NAME; //여행지 이름
	private String DEST_COUNTRY; //여행지 국가
	private String DEST_NAME_ENG; //여행지 이름 영어
	private String DEST_CONTENT;//여행지 소개글
	private int DEST_MONEY;//여행지 비용 속성 점수
	private int DEST_LANDSCAPE;//여행지 경치 속성 점수
	private int DEST_FUN;//여행지 재미 속성 점수
	private String DEST_TAG; //여행지 태그, 공백으로 분리
	private String DEST_IMG; //여행지 이미지 주소
	
	
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
	public int getDEST_MONEY() {
		return DEST_MONEY;
	}
	public void setDEST_MONEY(int dEST_MONEY) {
		DEST_MONEY = dEST_MONEY;
	}
	public int getDEST_LANDSCAPE() {
		return DEST_LANDSCAPE;
	}
	public void setDEST_LANDSCAPE(int dEST_LANDSCAPE) {
		DEST_LANDSCAPE = dEST_LANDSCAPE;
	}
	public int getDEST_FUN() {
		return DEST_FUN;
	}
	public void setDEST_FUN(int dEST_FUN) {
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
	
	

	
	
}