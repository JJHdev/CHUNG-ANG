package business.egov.cmmvo;

import java.io.Serializable;

public class CounterMeasuresNwVO implements Serializable {
	
	private int nw_impact_stage;
	private int nw_national_code;
	private String nw_field;
	private String nw_division;
	private String nw_response_range;
	private String nw_response_target;
	private String nw_response_phrase;
	
	public int getNw_impact_stage() {
		return nw_impact_stage;
	}
	public void setNw_impact_stage(int nw_impact_stage) {
		this.nw_impact_stage = nw_impact_stage;
	}
	public int getNw_national_code() {
		return nw_national_code;
	}
	public void setNw_national_code(int nw_national_code) {
		this.nw_national_code = nw_national_code;
	}
	public String getNw_field() {
		return nw_field;
	}
	public void setNw_field(String nw_field) {
		this.nw_field = nw_field;
	}
	public String getNw_division() {
		return nw_division;
	}
	public void setNw_division(String nw_division) {
		this.nw_division = nw_division;
	}
	public String getNw_response_range() {
		return nw_response_range;
	}
	public void setNw_response_range(String nw_response_range) {
		this.nw_response_range = nw_response_range;
	}
	public String getNw_response_target() {
		return nw_response_target;
	}
	public void setNw_response_target(String nw_response_target) {
		this.nw_response_target = nw_response_target;
	}
	public String getNw_response_phrase() {
		return nw_response_phrase;
	}
	public void setNw_response_phrase(String nw_response_phrase) {
		this.nw_response_phrase = nw_response_phrase;
	}
	@Override
	public String toString() {
		return "CounterMeasuresNwVO [nw_impact_stage=" + nw_impact_stage + ", nw_national_code=" + nw_national_code
				+ ", nw_field=" + nw_field + ", nw_division=" + nw_division + ", nw_response_range=" + nw_response_range
				+ ", nw_response_target=" + nw_response_target + ", nw_response_phrase=" + nw_response_phrase + "]";
	}
	
}
