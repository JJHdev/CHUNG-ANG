package business.egov.cmmvo;

import java.util.Date;
import java.util.List;

public class ImpactLevelCityCountQuery {
	  private List<String> columns;
	  private Date selectDate;
	  
	public List<String> getColumns() {
		return columns;
	}
	public void setColumns(List<String> columns) {
		this.columns = columns;
	}
	public Date getSelectDate() {
		return selectDate;
	}
	public void setSelectDate(Date selectDate) {
		this.selectDate = selectDate;
	}
	@Override
	public String toString() {
		return "ImpactLevelCityCountQuery [columns=" + columns + ", selectDate=" + selectDate + "]";
	}
	  
}
