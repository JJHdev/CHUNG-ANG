package business.biz.rxutil;

import java.util.HashMap;
import java.util.List;

import egovframework.rte.psl.dataaccess.util.EgovMap;

public interface CommUtilService {

	
	
	public List<EgovMap> CommSearchSido();
	public List<EgovMap> CommSearchSgg(EgovMap param);
	public List<EgovMap> CommGetInforData(EgovMap param);
	public List<EgovMap> commGetWideInforData(EgovMap param);
	
	public List<EgovMap> CommGetSmatchH();
	public List<EgovMap> CommGetSmatchP();
	public List<EgovMap> CommGetSmatchT();
	public List<EgovMap> CommGetSmatchW();
	
	public List<EgovMap> CommGetHistSgAvg(EgovMap param);
	
	public List<EgovMap> commGetHistWdAvg(EgovMap param);

	
	// 축산 - 폐사수
	public List<EgovMap> CommGetLivestockdeadTotalTb(EgovMap param);
	// 축산 - 폐사율
	public List<EgovMap> CommGetLivestockDeathRateTotalTb(EgovMap param);
	// 수산양식업
	public List<EgovMap> CommGetWaterfarmAmountTotalTb(EgovMap param);
	// 전력
	public List<EgovMap> CommGetPowerTotalTb(EgovMap param);
	// 보건 - 온열 질환자 수
	public List<EgovMap> CommGetHealthDiseaseTotalTb(EgovMap param);
	// 보건 - 온열 사망자 수
	public List<EgovMap> CommGetHealthDeadsgTb(EgovMap param);
	// 보건 - 온열질환자 발생률
	public List<EgovMap> CommGetHealthIncidenceTotalTb(EgovMap param);
	// 보건 - 온열질환자 사망률
	public List<EgovMap> CommGetHealthDeathRateTb(EgovMap param);
	
	
	
	
	
	
	
	
	
}
