package business.sys.sec.user;

import javax.persistence.Entity;
import javax.validation.constraints.NotEmpty;

@Entity
public class LoginRequest {
	
	@NotEmpty(message="아이디를 입력해주세요.")
	private String userid;
	@NotEmpty(message="비밀번호를 입력해주세요.")
	private String userpw;
	private boolean access;

	//getter
	public String getUserid() {
		return userid;
	}
	public String getUserpw() {
		return userpw;
	}
	public boolean getAccess() {
		return access;
	}
	
	//setter
	public void setUserid(String userid) {
		this.userid = userid;
	}
	public void setUserpw(String userpw) {
		this.userpw = userpw;
	}
	public void setAccess(boolean access) {
		this.access = access;
	}
}
