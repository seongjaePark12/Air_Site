		function fCheck(){
			var AIR_ORDER_WAY = myform.AIR_ORDER_WAY.value;
			var AIR_RV_DEP = myform.AIR_RV_DEP.value;
			var AIR_RV_ARR = myform.AIR_RV_ARR.value;
			var AIR_RV_GO = myform.AIR_RV_GO.value;
			var AIR_RV_BACK = myform.AIR_RV_BACK.value;
			
    	if(AIR_RV_DEP==""){
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
			else if(AIR_RV_GO==""){
					alert("가는날짜를 입력하세요!");  
					myform.AIR_RV_GO.focus();
					return false;
			}
			else if(AIR_RV_BACK==""){
					alert("오는날짜를 입력하세요!");  
					myform.AIR_RV_BACK.focus();
					return false;
			}
			else{
				$.ajax({
	    		type : "post",
	    		url  : "../order/airSearch",
	    		data : {
	    			AIR_ORDER_WAY : AIR_ORDER_WAY,
	    			AIR_RV_DEP : AIR_RV_DEP,
	    			AIR_RV_ARR : AIR_RV_ARR,
	    			AIR_RV_GO : AIR_RV_GO,
	    			AIR_RV_BACK : AIR_RV_BACK
	    		},
		  		error:function() {
		  			alert("처리 실패!!");
		  		}
	    	});
			}   
    } 
