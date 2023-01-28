package checkID;

public class LoginBean {
	
	private String userid;
	private String passwd;
	
	final String _userid="marklee";
	final String _passwd="taco127";
	
	public boolean checkUser() {
		if(userid.equals(_userid)&&passwd.equals(_passwd)) {
			return true;
		}else {
			return false;
		}
	}

	public String getUserid() {
		return userid;
	}

	public void setUserid(String userid) {
		this.userid = userid;
	}

	public String getPasswd() {
		return passwd;
	}

	public void setPasswd(String passwd) {
		this.passwd = passwd;
	}

	public String get_userid() {
		return _userid;
	}

	public String get_passwd() {
		return _passwd;
	}
	
	

}
