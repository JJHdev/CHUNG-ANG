package business.biz.rxutil;

import java.util.HashMap;
import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import business.biz.main.MainDAO;
import egovframework.rte.fdl.cmmn.EgovAbstractServiceImpl;
import egovframework.rte.psl.dataaccess.util.EgovMap;

@Service("CommUtilService")
@Transactional
public class CommUtilServiceImpl extends EgovAbstractServiceImpl implements CommUtilService{

	
	@Resource(name="CommUtilDAO")
	private CommUtilDAO commUtilDAO;

	
	public List<EgovMap> CommSearchSido(){
		return this.commUtilDAO.CommSearchSido();
	}
	public List<EgovMap> CommSearchSgg(EgovMap param){
		return this.commUtilDAO.CommSearchSgg(param);
	}
	public List<EgovMap> CommGetInforData(EgovMap param){
		return this.commUtilDAO.CommGetInforData(param);
	}
	public List<EgovMap> commGetWideInforData(EgovMap param){
		return this.commUtilDAO.commGetWideInforData(param);
	}

	
	public List<EgovMap> CommGetSmatchH(){ return this.commUtilDAO.CommGetSmatchH();}
	public List<EgovMap> CommGetSmatchP(){ return this.commUtilDAO.CommGetSmatchP();}
	public List<EgovMap> CommGetSmatchT(){ return this.commUtilDAO.CommGetSmatchT();}
	public List<EgovMap> CommGetSmatchW(){ return this.commUtilDAO.CommGetSmatchW();}
	
	public List<EgovMap> CommGetHistSgAvg(EgovMap param){ return this.commUtilDAO.CommGetHistSgAvg(param);}
	
	public List<EgovMap> commGetHistWdAvg(EgovMap param){ return this.commUtilDAO.commGetHistWdAvg(param);}

	// 축산 - 폐사수
	public List<EgovMap> CommGetLivestockdeadTotalTb(EgovMap param){ return this.commUtilDAO.CommGetLivestockdeadTotalTb(param);}
	// 축산 - 폐사율
	public List<EgovMap> CommGetLivestockDeathRateTotalTb(EgovMap param){ return this.commUtilDAO.CommGetLivestockDeathRateTotalTb(param);}
	// 수산양식업
	public List<EgovMap> CommGetWaterfarmAmountTotalTb(EgovMap param){ return this.commUtilDAO.CommGetWaterfarmAmountTotalTb(param);}
	// 전력
	public List<EgovMap> CommGetPowerTotalTb(EgovMap param){ return this.commUtilDAO.CommGetPowerTotalTb(param);}
	// 보건 - 온열 질환자 수
	public List<EgovMap> CommGetHealthDiseaseTotalTb(EgovMap param){ return this.commUtilDAO.CommGetHealthDiseaseTotalTb(param);}
	// 보건 - 온열 사망자 수
	public List<EgovMap> CommGetHealthDeadsgTb(EgovMap param){ return this.commUtilDAO.CommGetHealthDeadsgTb(param);}
	// 보건 - 온열질환자 발생률
	public List<EgovMap> CommGetHealthIncidenceTotalTb(EgovMap param){ return this.commUtilDAO.CommGetHealthIncidenceTotalTb(param);}
	// 보건 - 온열질환자 사망률
	public List<EgovMap> CommGetHealthDeathRateTb(EgovMap param){ return this.commUtilDAO.CommGetHealthDeathRateTb(param);}

	
	
	
	
	
	
	
	
	
	

	
}
