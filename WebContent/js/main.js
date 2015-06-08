


//1.checkbox全选-----------------------------------------------------
//function isAllChecked(){
//	var checkall = document.getElementById("checkboxAll");
//	if(checkall.checked==true){
//		 selectAll();
//	}
//	else
//		emptyAll();
//}
//
//function selectAll(){ //全选     
//    // var inputs = document.getElementsByTagName("input");  
//    var inputs = document.getElementsByClassName("everyCheck");     
//    for(var i=0;i<inputs.length;i++){     
//      if(inputs[i].getAttribute("type") == "checkbox"){     
//        inputs[i].checked = true;     
//      }     
//    }     
//  }
//
//function emptyAll(){ //全不选     
//	var inputs = document.getElementsByClassName("everyCheck");     
//	for(var i=0;i<inputs.length;i++){     
//	  if(inputs[i].getAttribute("type") == "checkbox"){     
//	    inputs[i].checked = false;     
//	  }     
//	}     
//}


function isAllChecked(){
	var $everyCheck = $(".everyCheck[type='checkbox']");
	var checkall = document.getElementById("checkboxAll");
	if(checkall.checked==true){
		$everyCheck.prop("checked", true);//全选
	}
	else
		$everyCheck.prop("checked", false);
}







function deleteCheckPeople(max){
	// var array = new Array();	
	var array="";
	for(var id = 1; id <= max; id++){
		var checkeId = document.getElementById("checkPeople-"+id);
		if(checkeId!=null && checkeId.checked==true){
			// alert(id);
			// array.push(id);
			array += id+"_";
		}
		else continue;
	}
	window.self.location = "action/action-delete-people.jsp?idArray="+array;
}


function deleteCheckDevice(max){
	var array="";
	for(var id = 1; id <= max; id++){
		var checkeId = document.getElementById("checkDevice-"+id);
		if(checkeId!=null && checkeId.checked==true){
			array += id+"_";
		}
		else continue;
	}
	window.self.location = "action/action-delete-device.jsp?idArray="+array;
}




首页心跳效果
$(document).ready(function(){
	var $heart = $(".login-logo-image-heart");
	heartbeat();
	function heartbeat(){
		$heart.animate({width:'35px',left:'42px',top:'132px'},1000);
		$heart.animate({width:'50px',left:'35px',top:'125px'},1000);
		heartbeat();
	}
	
});




