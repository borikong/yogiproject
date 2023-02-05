package net.dest.db;

public class DestVO {
	private int DEST_ID; //여행지 id(식별번호 unique)
	private String DEST_NAME; //여행지 이름
	private String DEST_COUNTRY; //여행지 국가
	private String DEST_NAME_ENG; //여행지 이름 영어
	private String DEST_CONTENT;//여행지 소개글
	private String DEST_MONEY;//여행지 비용 속성 점수
	private String DEST_LANDSCAPE;//여행지 경치 속성 점수
	private String DEST_FUN;//여행지 재미 속성 점수
	private String DEST_TAG; //여행지 태그, 공백으로 분리
	
	
	public int getDEST_ID() {
		return DEST_ID;
	}
	public void setDEST_ID(int dEST_ID) {
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
	public String getDEST_MONEY() {
		return DEST_MONEY;
	}
	public void setDEST_MONEY(String dEST_MONEY) {
		DEST_MONEY = dEST_MONEY;
	}
	public String getDEST_LANDSCAPE() {
		return DEST_LANDSCAPE;
	}
	public void setDEST_LANDSCAPE(String dEST_LANDSCAPE) {
		DEST_LANDSCAPE = dEST_LANDSCAPE;
	}
	public String getDEST_FUN() {
		return DEST_FUN;
	}
	public void setDEST_FUN(String dEST_FUN) {
		DEST_FUN = dEST_FUN;
	}
	public String getDEST_TAG() {
		return DEST_TAG;
	}
	public void setDEST_TAG(String dEST_TAG) {
		DEST_TAG = dEST_TAG;
	}
	
	
	
}
