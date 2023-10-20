package business.biz.rxutil;


import java.util.HashMap;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import business.biz.main.MainDAO;
import business.egov.cmm.service.impl.EgovComAbstractDAO;
import egovframework.rte.psl.dataaccess.util.EgovMap;

@Repository("CommUtilDAO")
public class CommUtilDAO extends EgovComAbstractDAO {

	@Autowired
	private SqlSessionTemplate session;

	
	public List<EgovMap> CommSearchSido(){
		return selectList("CommUtil.commSearchSido");
	}
	public List<EgovMap> CommSearchSgg(EgovMap param){
		return selectList("CommUtil.commSearchSgg", param);
	}
	public List<EgovMap> CommGetInforData(EgovMap param){
		return selectList("CommUtil.commGetInforData", param);
	}
	public List<EgovMap> commGetWideInforData(EgovMap param){
		return selectList("CommUtil.commGetWideInforData", param);
	}

	
	public List<EgovMap> CommGetSmatchH(){ return selectList("CommUtil.commGetSmatchH"); }
	public List<EgovMap> CommGetSmatchP(){ return selectList("CommUtil.commGetSmatchP"); }
	public List<EgovMap> CommGetSmatchT(){ return selectList("CommUtil.commGetSmatchT"); }
	public List<EgovMap> CommGetSmatchW(){ return selectList("CommUtil.commGetSmatchW"); }

	public List<EgovMap> CommGetHistSgAvg(EgovMap param){ return selectList("CommUtil.commGetHistSgAvg", param); }
	
	public List<EgovMap> commGetHistWdAvg(EgovMap param){ return selectList("CommUtil.commGetHistWdAvg", param); }
	
	// 축산 - 폐사수
	public List<EgovMap> CommGetLivestockdeadTotalTb(EgovMap param){ return selectList("CommUtil.commGetLivestockdeadTotalTb", param); }
	// 축산 - 폐사율
	public List<EgovMap> CommGetLivestockDeathRateTotalTb(EgovMap param){ return selectList("CommUtil.commGetLivestockDeathRateTotalTb", param); }
	// 수산양식업
	public List<EgovMap> CommGetWaterfarmAmountTotalTb(EgovMap param){ return selectList("CommUtil.commGetWaterfarmAmountTotalTb", param); }
	// 전력
	public List<EgovMap> CommGetPowerTotalTb(EgovMap param){ return selectList("CommUtil.commGetPowerTotalTb", param); }
	
	// 보건 - 온열 질환자 수
	public List<EgovMap> CommGetHealthDiseaseTotalTb(EgovMap param){ return selectList("CommUtil.commGetHealthDiseaseTotalTb", param); }
	// 보건 - 온열 사망자 수
	public List<EgovMap> CommGetHealthDeadsgTb(EgovMap param){ return selectList("CommUtil.commGetHealthDeadsgTb", param); }
	// 보건 - 온열질환자 발생률
	public List<EgovMap> CommGetHealthIncidenceTotalTb(EgovMap param){ return selectList("CommUtil.commGetHealthIncidenceTotalTb", param); }
	// 보건 - 온열질환자 사망률
	public List<EgovMap> CommGetHealthDeathRateTb(EgovMap param){ return selectList("CommUtil.commGetHealthDeathRateTb", param); }
	
	
	
	
	
	
	
	
}
