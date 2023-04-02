package business.sys.sec.handler;

import java.util.ArrayList;
import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.authentication.AuthenticationProvider;
import org.springframework.security.authentication.BadCredentialsException;
import org.springframework.security.authentication.UsernamePasswordAuthenticationToken;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.AuthenticationException;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.authority.SimpleGrantedAuthority;
import org.springframework.security.core.userdetails.UsernameNotFoundException;

import business.sys.cmm.util.EncryptionComponent;
import business.sys.cmm.util.UtilityComponent;
import business.sys.sec.user.UserAccessService;
import business.sys.sec.user.UserAccessVO;

/**
 * 사용자의 로그인 처리
 * --------------------------------------------------
 * 		수정일			수정자			수정내용
 * --------------------------------------------------
 * 	2018.08.13			vestap개발		최초 작성
 * --------------------------------------------------
 * @author vestap 개발
 * @since 2018.08.13
 *
 */
public class BusinessAuthenticationProvider implements AuthenticationProvider {
	
	private static final Logger logger = LoggerFactory.getLogger(BusinessAuthenticationProvider.class);
	
	@Autowired
	private UtilityComponent utilComp;
	
	@Autowired
	private UserAccessService SERVICE;
	
	@Autowired
	private EncryptionComponent encComp;
	
	@Override
	public Authentication authenticate(Authentication authentication) throws AuthenticationException {
		
		UsernamePasswordAuthenticationToken authToken = (UsernamePasswordAuthenticationToken) authentication;
		
		String id = authToken.getName();
		String password = authToken.getCredentials().toString();
		
		try {
			System.out.println("*********************************");
			System.out.println("id : ");
			System.out.println(id);
			System.out.println("*********************************");
			System.out.println("pw : " );
			System.out.println(password);
			password = this.encComp.sha256(authToken.getCredentials().toString());
			
		} catch (Exception e) {
			logger.error(this.utilComp.stackTrace(e));
			throw new BadCredentialsException("사용자 인증에 문제가 발생 했습니다.");
		}
		
		UserAccessVO userVO = null;
		
		try {
			
			userVO = this.SERVICE.getUserInfo(id);
			
			this.SERVICE.updateUserAccess(id);
			
		} catch (Exception e) {
			logger.error(this.utilComp.stackTrace(e));
			throw new BadCredentialsException("사용자 인증에 문제가 발생 했습니다.");
		}
		
		if(userVO != null) {
			
			if(userVO.getUser_password().equals(password)) {
				
				List<GrantedAuthority> authorities = new ArrayList<GrantedAuthority>();
				
				/**
				 * 권한 확인
				 * A: 관리자
				 * W: 광역(시도) 사용자
				 * B: 기초(시군구) 사용자
				 */
				
				UsernamePasswordAuthenticationToken authenticationToken = new UsernamePasswordAuthenticationToken(id, password, authorities);
				
				BusinessUserDetails details = new BusinessUserDetails();
				
				details.setUser_id(userVO.getUser_id());
				details.setAuthorities(authorities);
				
				authenticationToken.setDetails(details);
				
				//this.SERVICE.insertAccessLog(userVO.getUser_id());
				
				return authenticationToken;
				
			} else {
				throw new BadCredentialsException("비밀번호가 일치하지 않습니다.");
			}
			
		} else {
			throw new UsernameNotFoundException(authToken.getName() + " 님에 대한 사용자 정보가 없습니다. 사용자 ID를 확인해 주세요.");
		}
		
	}
	
	@Override
	public boolean supports(Class<?> authentication) {
		return authentication.equals(UsernamePasswordAuthenticationToken.class);
	}

}
