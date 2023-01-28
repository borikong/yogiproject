package net.dog.db;

public class DogBean {
	
	private String MEMBER_ID;
	private String DOG_NAME;
	private int DOG_BYEAR;
	private int DOG_BMONTH;
	private int DOG_BDATE;
	private int DOG_AGE;
	private String DOG_BREED;
	private String DOG_SEX;
	private int DOG_WEIGHT;
	
	
	
	public String getMEMBER_ID(){
		return MEMBER_ID;
	}
	
	public void setMEMBER_ID(String mEMBER_ID){
		MEMBER_ID=mEMBER_ID;
	}
	
	public String getDOG_NAME() {
		return DOG_NAME;
	}
	
	public void setDOG_NAME(String dOG_NAME) {
		DOG_NAME = dOG_NAME;
	}
	
	
	
	public int getDOG_BYEAR() {
		return DOG_BYEAR;
	}

	public void setDOG_BYEAR(int dOG_BYEAR) {
		DOG_BYEAR = dOG_BYEAR;
	}

	public int getDOG_BMONTH() {
		return DOG_BMONTH;
	}

	public void setDOG_BMONTH(int dOG_BMONTH) {
		DOG_BMONTH = dOG_BMONTH;
	}

	public int getDOG_BDATE() {
		return DOG_BDATE;
	}

	public void setDOG_BDATE(int dOG_BDATE) {
		DOG_BDATE = dOG_BDATE;
	}

	public int getDOG_AGE() {
		return DOG_AGE;
	}
	
	public void setDOG_AGE(int dOG_AGE) {
		
		  /* Calendar current = Calendar.getInstance();
	        int currentYear  = current.get(Calendar.YEAR);
	        int currentMonth = current.get(Calendar.MONTH) + 1;
	        int currentDay   = current.get(Calendar.DAY_OF_MONTH);
	       
	        int age = currentYear - this.getDOG_BYEAR();
	        // 생일 안 지난 경우 -1
	        if (this.getDOG_BMONTH() * 100 + this.getDOG_BDATE() > currentMonth * 100 + currentDay)  
	            age--;
	        
		DOG_AGE = age;*/
		DOG_AGE=dOG_AGE;
	}
	
	public String getDOG_BREED() {
		return DOG_BREED;
	}
	
	public void setDOG_BREED(String dOG_BREED) {
		DOG_BREED = dOG_BREED;
	}
	
	public String getDOG_SEX() {
		return DOG_SEX;
	}
	
	public void setDOG_SEX(String dOG_SEX) {
		DOG_SEX = dOG_SEX;
	}
	
	public int getDOG_WEIGHT() {
		return DOG_WEIGHT;
	}
	
	public void setDOG_WEIGHT(int dOG_WEIGHT) {
		DOG_WEIGHT = dOG_WEIGHT;
	}
	
	
}
