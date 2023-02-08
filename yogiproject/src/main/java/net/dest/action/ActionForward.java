package net.dest.action;

import javax.servlet.http.HttpServletRequest;

public class ActionForward {

	private boolean isRedirect=false;
	private String path=null;
	private HttpServletRequest request;
	
	public boolean isRedirect() {
		return isRedirect;
	}
	
	public String getPath() {
		return path;
	}
	
	public void setRedirect(boolean b) {
		isRedirect=b;
	}
	
	public void setPath(String string) {
		path=string;
	}

	public HttpServletRequest getRequest() {
		return request;
	}

	public void setRequest(HttpServletRequest request) {
		this.request = request;
	}
	
	
}