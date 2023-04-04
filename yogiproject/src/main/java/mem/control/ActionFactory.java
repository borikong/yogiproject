package mem.control;

import mem.action.*;

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
	
	// 메소드
	public Action getAction(String cmd) {
		
		Action action = null;
		
		switch(cmd){
		
		case "regForm":
			action = new RegFormAction();
			break;
		
		case "idCheck":
			action = new IdCheckAction();
			break;	
			
		case "emailCheck":
			action = new EmailCheckAction();
			break;	
		case "regProc":
			action = new RegProcAction();
			break;
		
		case "zipCheck":
			action = new ZipCheckAction();
			break;
		
		case "login":
			action = new LoginFormAction();
			break;	
		
		// loginProc.jsp 생성없이 LoginProcAction에서 처리
		case "loginProc":
			action = new LoginProcAction();
			break;
			
		case "logout":
			action = new LogoutAction();
			break;
		
		case "modifyForm":
			action = new ModifyFormAction();
			break;
		
		case "modifyProc":
			action = new ModifyProcAction();
			break;
		
		case "deleteForm":
			action = new DeleteFormAction();
			break;
						
		case "deleteProc":
			action = new DeleteProcAction();
			break;	
		
		case "mypage":
			action = new MypageAction();
			break;	
			
		case "searchid":
			action = new SearchId();
			break;
		
		case "searchpass":
			action = new SearchPass();
			break;
			
		default:
			action = new LoginFormAction();
			break;
		}	
		

		return action;
	}
	
}
