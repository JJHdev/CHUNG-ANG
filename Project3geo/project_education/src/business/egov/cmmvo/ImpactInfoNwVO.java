package business.egov.cmmvo;

import java.io.Serializable;

public class ImpactInfoNwVO implements Serializable {
	
	private int nw_impact_stage;
	private int nw_national_code;
	private String nw_field;
	private String nw_division;
	private String nw_impact_range;
	private String nw_impact_target;
	private String nw_influence_phrase;
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
	public String getNw_impact_range() {
		return nw_impact_range;
	}
	public void setNw_impact_range(String nw_impact_range) {
		this.nw_impact_range = nw_impact_range;
	}
	public String getNw_impact_target() {
		return nw_impact_target;
	}
	public void setNw_impact_target(String nw_impact_target) {
		this.nw_impact_target = nw_impact_target;
	}
	public String getNw_influence_phrase() {
		return nw_influence_phrase;
	}
	public void setNw_influence_phrase(String nw_influence_phrase) {
		this.nw_influence_phrase = nw_influence_phrase;
	}
	@Override
	public String toString() {
		return "ImpactInfoNwVO [nw_impact_stage=" + nw_impact_stage + ", nw_national_code=" + nw_national_code
				+ ", nw_field=" + nw_field + ", nw_division=" + nw_division + ", nw_impact_range=" + nw_impact_range
				+ ", nw_impact_target=" + nw_impact_target + ", nw_influence_phrase=" + nw_influence_phrase + "]";
	}

}
