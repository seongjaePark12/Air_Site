		function fCheck(){
			var AIR_AIR_CODE = myform.AIR_AIR_CODE.value;
			var AIR_RV_DEP = myform.AIR_RV_DEP.value;
			var AIR_RV_ARR = myform.AIR_RV_ARR.value;
			var AIR_RV_DAY = myform.AIR_RV_DAY.value;
			var AIR_RV_TIME = myform.AIR_RV_TIME.value;
			var AIR_RV_FS = myform.AIR_RV_FS.value;
			var AIR_RV_BS = myform.AIR_RV_BS.value;
			var AIR_RV_ES = myform.AIR_RV_ES.value;
			var AIR_RV_FP = myform.AIR_RV_FP.value;
			var AIR_RV_BP  = myform.AIR_RV_BP.value;
			var AIR_RV_EP = myform.AIR_RV_EP.value;
			var regExpPrice = /^[0-9|_]*$/;  // 가격은 숫자만
			
	    	if(AIR_AIR_CODE==""){
					alert("비행기를 선택하세요!");      
					myform.AIR_AIR_CODE.focus();
						return false;
				}
				else if(AIR_RV_DEP==""){
					alert("출발지역을 선택하세요!");      
					myform.AIR_RV_DEP.focus();
						return false;
				}
				else if(AIR_RV_ARR==""){
					alert("도착지역을 선택하세요!"); 
					myform.AIR_RV_ARR.focus();       
						return false;
				}
				else if(AIR_RV_DEP == AIR_RV_ARR){
						alert("출발지역과 도착지역은 같을 수 없습니다!");     
						myform.AIR_RV_DEP.focus();
						return false;
				}
				else if(AIR_RV_DAY==""){
						alert("날짜를 입력하세요!");  
						myform.AIR_RV_DAY.focus();
						return false;
				}
				else if(AIR_RV_TIME==""){
					alert("비행시간을 입력하세요!");  
					myform.AIR_RV_TIME.focus();
						return false;
				}
				else if(AIR_RV_FS==""){
					alert("좌석수를 입력하세요!");  
					myform.AIR_RV_FS.focus();
						return false;
				}
				else if(AIR_RV_BS==""){
					alert("좌석수를 입력하세요!");  
					myform.AIR_RV_BS.focus();
						return false;
				}
				else if(AIR_RV_ES==""){
					alert("좌석수를 입력하세요!");  
					myform.AIR_RV_ES.focus();
						return false;
				}
				else if(AIR_RV_FP=="" || !regExpPrice.test(AIR_RV_FP)){
						alert("가격을 제대로 입력하세요!"); 
						myform.AIR_RV_FP.focus();
						return false;
				}
				else if(AIR_RV_BP=="" || !regExpPrice.test(AIR_RV_BP)){
						alert("가격을 제대로 입력하세요!");    
						myform.AIR_RV_BP.focus();
						return false;
				}
				else if(AIR_RV_EP=="" || !regExpPrice.test(AIR_RV_EP)){
						alert("가격을 제대로 입력하세요!");    
						myform.AIR_RV_EP.focus();
						return false;
				}
				else{
					myform.submit();
				}    
		}