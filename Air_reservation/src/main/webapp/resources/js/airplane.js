    function airCheck() {
    	var AIR_AIR_CODE = airForm.AIR_AIR_CODE.value;
    	var AIR_AIR_NAME = airForm.AIR_AIR_NAME.value;
    	if(AIR_AIR_CODE == "") {
    		alert("비행기 코드를 입력하세요");
    		airForm.AIR_AIR_CODE.focus();
    		return false;
    	}
    	if(AIR_AIR_NAME == "") {
    		alert("비행기명을 입력하세요");
    		airForm.AIR_AIR_NAME.focus();
    		return false;
    	}
    	$.ajax({
    		type : "post",
    		url  : "../rv/airplaneInput",
    		data : {
    			AIR_AIR_CODE : AIR_AIR_CODE,
    			AIR_AIR_NAME : AIR_AIR_NAME
    		},
    		success:function(data) {
    			if(data == "0") alert("같은 비행기가 등록되어 있습니다.");
    			else location.reload();
    		},
    		error : function() {
    			alert('전송오류!');
    		}
    	});
    }
    
    function delAir(AIR_AIR_CODE) {
    	var ans = confirm("비행기항목을 삭제하시겠습니까?");
    	if(!ans) return false;
    	$.ajax({
    		type : "post",
    		url  : "../rv/delAir",
    		data : {AIR_AIR_CODE : AIR_AIR_CODE},
    		success:function(data) {
    				location.reload();
    		}
    	});
    }