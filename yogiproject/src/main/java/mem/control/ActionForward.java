package mem.control;

public class ActionForward {

	private String url; // 주소 저장 변수
	private boolean redirect; // 이동 방식 저장 변수
	
	public ActionForward() {}
	
	public ActionForward(String url) {
		this.url = url;
	}
	
	public ActionForward(String url, boolean redirect) {
		this.url = url;
		this.redirect = redirect;
	}

	public String getUrl() {
		return url;
	}

	public void setUrl(String url) {
		this.url = url;
	}

	public boolean isRedirect() {
		return redirect;
	}

	public void setRedirect(boolean redirect) {
		this.redirect = redirect;
	}
	
}
