package mem.control;

import java.io.IOException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


public interface Action {

	// 메소드 정의
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws IOException;
}
