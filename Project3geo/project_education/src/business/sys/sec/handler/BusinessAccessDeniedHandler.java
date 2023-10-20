package business.sys.sec.handler;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.security.access.AccessDeniedException;
import org.springframework.security.web.access.AccessDeniedHandler;

/**
 * 사용권한이 없는 사용자가 접근 시도 했을 경우 처리
 * --------------------------------------------------
 * 		수정일			수정자			수정내용
 * --------------------------------------------------
 * 	2018.08.13			vestap개발		최초 작성
 * --------------------------------------------------
 * @author vestap 개발
 * @since 2018.08.13
 *
 */
public class BusinessAccessDeniedHandler implements AccessDeniedHandler {
	
	@Override
	public void handle(HttpServletRequest request, HttpServletResponse response, AccessDeniedException e) throws IOException, ServletException {
		request.getRequestDispatcher("/accessDenied.do").forward(request, response);
	}

}
