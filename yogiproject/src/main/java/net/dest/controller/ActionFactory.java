package net.dest.controller;

public class ActionFactory {
	
	// 싱글톤
	private static ActionFactory factory;
	
	private ActionFactory() {}
	
	// 객체생성
	public static synchronized ActionFactory getInstance() {
		
		if(factory == null) {
			factory = new ActionFactory();
		}	
		return factory;
	}
	
	// import mvc
	public Action getAction(String cmd) {
		
		Action action = null;
		
		if(cmd.equals("index")) {
			//action = new IndexAction();
		}		
		return action;
	}
	
}
