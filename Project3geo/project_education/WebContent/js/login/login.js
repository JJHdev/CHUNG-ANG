/*
 * 
 *	함수명 겹치는 거 주의 
 * 
 * 
 * **********/
var LocalSession = {
	setItem : function(_id, _data){
		window.sessionStorage.setItem(_id, _data);
		
	},
	getItem : function(_id){
		return window.sessionStorage.getItem(_id);
	},
	counterUp : function(){
		var tmCounter = isNaN(Number(window.sessionStorage.getItem(SESSION_STATE.NDMI_COUNTER))) ? 0 : Number(window.sessionStorage.getItem(SESSION_STATE.NDMI_COUNTER));
		window.sessionStorage.setItem(SESSION_STATE.NDMI_COUNTER, tmCounter + 1);
	},
	resetSession : function(){
		window.sessionStorage.clear();
	}
}

function moveToLoginPage(){
	window.location.href = '/login.do';
}

function showLoginPannel(){
	var url = '/login.do';
	
 	$.ajax({ 
		url: url, 
		type: 'post',
		success: function(data){

			var loginPannel = document.getElementById('loginPannel');
			loginPannel.innerHTML = data;
			
			var loginInitFunc = document.getElementById('loginInitFunc');
			loginInitFunc.click();
		}
	
	});
}

function getLoginData(_id){
	var id = _id;
	
	var registerForm = document.getElementById(id);
	if(!registerForm) return console.log("Can not find Dom");
	
	var tempArr = [];
	
	for(var i=0; i < registerForm.childElementCount; i++){
		var child = registerForm.children[i].children[2];
		var name = child.name;
		var value = child.value;
		tempArr.push({name, value});
	}
	
	var tempObj = {};
	for(var i=0; i < tempArr.length; i++){
		tempObj[tempArr[i]['name']] = tempArr[i]['value'];
	}
		
	return tempObj;
}
  

// 벨리데이션
function regValidation(_data){
	var data = _data;
	
	var msg = '';
	if(data['userId'].trim() === ''){
		msg = '아이디를 입력해주세요.';
		alert(msg);
		return false;
	}
	if(data['userId'].trim().length < 4){
		msg = '아이디를 입력해주세요.';
		alert(msg);
		return false;
	}
	if(data['userPw'].trim() === ''){
		msg = '패스워드를 입력해주세요.';
		alert(msg);
		return false;
	}
	
	// 정규식 영어 + 숫자 // 로그인 시 한글 입력 안 되게 --
	var engNum = /^[a-zA-Z0-9]*$/;

	return true;
}
	


// ajax 호출
function callDoLoginFunc(_data){
	
	var data = _data;
	
	var url = '/loginProc.do';
	
 	$.ajax({ 
		url: url, 
		data: JSON.stringify(data),
		dataType : 'json',
		type: 'post',
		success: function(data){
			var heat_menu = new Array();
			var cold_menu = new Array();
			
			var menu = new Array();
			
			var msg = data['msg'];
			
			var today = new Date();   
			
			var month = today.getMonth() + 1;
			
			if(msg === 'SUCCESS'){
				console.log(data.data.user_id)
				
				var user_agent_code = data.data.user_agent_code;
				
				var user_type = data.data.user_type;
				
				localStorage.setItem("user_type", user_type);
				localStorage.setItem("user_agent_code", user_agent_code);
				localStorage.setItem("user_id", data.data.user_id);
				
				var url = '/api/admin/GetAgentActiveList.do';
				$.ajax({ 
					url: url, 
					type: 'post',
					data : {agentName : user_agent_code},
					dataType: 'json',
					async : false,
					success: function(data){
						var agentActiveAllList = data['db_agent_list'];
						
						console.log(agentActiveAllList)
						
						for(var i=0; i<agentActiveAllList.length; i++){
							menu.push(agentActiveAllList[i].cddt_idx);
						}
						
						if(menu.indexOf(1) != -1){
							localStorage.setItem("main_dp", "Y");
							heat_menu.push("main");
						} else if(menu.indexOf(1) == -1){
							localStorage.setItem("main_dp", "N");
						}
						
						if(menu.indexOf(2) != -1){
							localStorage.setItem("report_dp", "Y");
							heat_menu.push("report");
						} else if(menu.indexOf(2) == -1){
							localStorage.setItem("report_dp", "N");
						}
						
						if(menu.indexOf(3) != -1){
							localStorage.setItem("infor_dp", "Y");
							heat_menu.push("infor");
						} else if(menu.indexOf(3) == -1){
							localStorage.setItem("infor_dp", "N");
						}
						
						if(menu.indexOf(4) != -1){
							localStorage.setItem("weather_dp", "Y");
							heat_menu.push("weather");
						} else if(menu.indexOf(4) == -1){
							localStorage.setItem("weather_dp", "N");
						}
						
						if(menu.indexOf(5) != -1){
							localStorage.setItem("damage_dp", "Y");
							heat_menu.push("damage");
						} else if(menu.indexOf(5) == -1){
							localStorage.setItem("damage_dp", "N");
						}
						
						if(menu.indexOf(6) != -1){
							localStorage.setItem("exposure_dp", "Y");
							heat_menu.push("exposure");
						} else if(menu.indexOf(6) == -1){
							localStorage.setItem("exposure_dp", "N");
						}
						
						if(menu.indexOf(7) != -1){
							localStorage.setItem("damage_ex_dp", "Y");
							heat_menu.push("damage_ex");
						} else if(menu.indexOf(7) == -1){
							localStorage.setItem("damage_ex_dp", "N");
						}
						
						if(menu.indexOf(8) != -1){
							localStorage.setItem("comparison_dp", "Y");
							heat_menu.push("comparison");
						} else if(menu.indexOf(8) == -1){
							localStorage.setItem("comparison_dp", "N");
						}
						
						if(menu.indexOf(9) != -1){
							localStorage.setItem("verify_dp", "Y");
							heat_menu.push("verify");
						} else if(menu.indexOf(9) == -1){
							localStorage.setItem("verify_dp", "N");
						}
						
						if(menu.indexOf(10) != -1){
							localStorage.setItem("main_c_dp", "Y");
							cold_menu.push("main_c");
						} else if(menu.indexOf(10) == -1){
							localStorage.setItem("main_c_dp", "N");
						}
						
						if(menu.indexOf(11) != -1){
							localStorage.setItem("report_c_dp", "Y");
							cold_menu.push("report_c");
						} else if(menu.indexOf(11) == -1){
							localStorage.setItem("report_c_dp", "N");
						}
						
						if(menu.indexOf(12) != -1){
							localStorage.setItem("infor_c_dp", "Y");
							cold_menu.push("infor_c");
						} else if(menu.indexOf(12) == -1){
							localStorage.setItem("infor_c_dp", "N");
						}
						
						if(menu.indexOf(13) != -1){
							localStorage.setItem("weather_c_dp", "Y");
							cold_menu.push("weather_c");
						} else if(menu.indexOf(13) == -1){
							localStorage.setItem("weather_c_dp", "N");
						}
						
						if(menu.indexOf(14) != -1){
							localStorage.setItem("exposure_c_dp", "Y");
							cold_menu.push("exposure_c");
						} else if(menu.indexOf(14) == -1){
							localStorage.setItem("exposure_c_dp", "N");
						}
						
						if(menu.indexOf(15) != -1){
							localStorage.setItem("damage_c_dp", "Y");
							cold_menu.push("damage_c");
						} else if(menu.indexOf(15) == -1){
							localStorage.setItem("damage_c_dp", "N");
						}
						
						if(menu.indexOf(16) != -1){
							localStorage.setItem("comparison_c_dp", "Y");
							cold_menu.push("comparison_c");
						} else if(menu.indexOf(16) == -1){
							localStorage.setItem("comparison_c_dp", "N");
						}
						
						if(menu.indexOf(17) != -1){
							localStorage.setItem("verify_c_dp", "Y");
							cold_menu.push("verify_c");
						} else if(menu.indexOf(17) == -1){
							localStorage.setItem("verify_c_dp", "N");
						}
						
						localStorage.setItem("heat_menu", JSON.stringify(heat_menu));
						localStorage.setItem("cold_menu", JSON.stringify(cold_menu));
						
						if(user_type == 'ADMIN'){
							if(month == '4' || month == '5' || month == '6' || month == '7'|| month == '8' || month == '9'){
								window.location.href = '/report.do';
							} else {
								window.location.href = '/report.do';
							}
						} else {
							if(month == '4' || month == '5' || month == '6' || month == '7'|| month == '8' || month == '9'){
								if(heat_menu.length == 0){
									if(cold_menu.length == 0){
										alert("권한이 없습니다.");
									} else {
										window.location.href = '/report.do';
									}
								} else {
									window.location.href = '/report.do';
								}
							} else {
								if(cold_menu.length == 0){
									if(heat_menu.length == 0){
										alert("권한이 없습니다.");
									} else {
										window.location.href = '/report.do';
									}
								} else {
									window.location.href = '/report.do';
								}
							}
						}
						return
					},
					error : function(err){
						console.log(err);
					}
				});	
			}else{
				if(msg === 'LOCKED'){
					msg = '패스워드 5회 오류로 계정이 잠겨 있습니다.';
				}
				if(msg === 'WRONG PW'){
					msg = '비밀번호가 맞지 않습니다.';
				}
				alert(msg);
			}

		},
		error : function(err){
			var errMsg = err.statusText;
			console.log(err)
		}
	
	});
}


  	
  	
// 실행 
function doLogin(){
	
	var inputData = getLoginData('register_form');
	
	var valid = regValidation(inputData);
	
	if(!valid) return;
	
	
	// 브라우저 세션 비우기
//	LocalSession.resetSession();
	
	// 실행부
	callDoLoginFunc(inputData);
	
}  	

function loginInit(){

	var url = '/checkSession.do';
	
 	$.ajax({ 
		url: url, 
		dataType : 'json',
		type: 'post',
		success: function(data){
			if(data['data'] === null) return;
			
			var isLogined = data['data']['isLogined'];
			if(isLogined){
				if(data['data']['user_type'] === 'ADMIN') {
					$(".footer_common").hide();
					$(".footer_admin").show();
				} else {
					$(".footer_common").show();
					$(".footer_admin").hide();
				}
			}else{
				console.log("Not Logined Yet");
			}
		},
		error:function(request,status,error){
//	        	alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
				console.log(error)
	        }
		});
  		
}

//로그아웃
function doLogOut(){
	var url = '/loginOut.do';
	
 	$.ajax({ 
		url: url, 
		dataType : 'json',
		type: 'post',
		success: function(data){
			
			var msg = data['msg'];
			
			if(msg === 'SUCCESS'){
				// display hide and show
				window.location.href = '/login.do';
			}
			
		}
	
	});
}


window.onload = function(){
	loginInit();
}


