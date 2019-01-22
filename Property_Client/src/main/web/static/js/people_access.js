
//启动加载函数
$(function(){
	//$("#face_token").hide();
});


function hasUserMedia(){//判断是否支持调用设备api，因为浏览器不同所以判断方式不同哦    
    return !!(navigator.getUserMedia || navigator.webkitGetUserMedia || navigator.mozGetUserMedia || navigator.msGetUserMedia);    
}    
if(hasUserMedia()){    
    //alert(navigator.mozGetUserMedia)    
    navigator.getUserMedia = navigator.getUserMedia || navigator.webkitGetUserMedia || navigator.mozGetUserMedia || navigator.msGetUserMedia;    
    var video=document.querySelector("video");    
    var canvas=document.querySelector("canvas");  
    var streaming = false;  
    navigator.getUserMedia({    
        video:true,//开启视频    
        audio:false//先关闭音频，因为会有回响，以后两台电脑通信不会有响声    
    },function(stream){//将视频流交给video    
        video.src=window.URL.createObjectURL(stream);     
        streaming = true;  
    },function(err){    
        console.log("capturing",err)    
    });    
    document.querySelector("#capture").addEventListener("click",function(event){  
        if(streaming){  
            
        	var token = "";
        	var flag = false;
        	
        	
            canvas.width = 800;  
            canvas.height = 800;  
            var context = canvas.getContext('2d');  
            imgString = canvas.toDataURL("image/png");
            context.drawImage(video,20,20);
            //saveImage(canvas, 'screen_' + new Date().getTime() + '.png');  // 存储图片到本地
            
            var imgData = canvas.toDataURL("image/png");
            imgData = imgData.replace(/[+]/g, "＋");
            
            var data = canvas.toDataURL("image/png");
            var photo = data.substring(22);

      		  
            /* 将图片名字发送都后端 */
           $.ajax({
        	   url:"http://localhost:8080/Property/facePhotoGraph",
     			//data:"imgString="+imgData,
     			data:"imgString="+imgData,
     			type:"post",
     			dataType:"jsonp",
     			success:function(datas){
     				
     				//alert(datas.data.face_token);
     				var token = datas.data.face_token;
     				if(typeof(token) == "undefined"){
     					alert("服务器繁忙,请重试！");
     				}else{
     					$("#face_token").text(token);
     					//成功获取face_token，保存在li中，开始进行人脸判断
     					setCookie("search_token",token);
     					faceSearch();
     				}
  					//alert(datas.data.face_token);
   					/*$("#face_token").val(datas.data.face_token);
   					var obj = document.getElementById('face_token').getElementsByTagName("face_token");
      				obj.innerHTML = datas.data.face_token;*/
  					


     					
     			},
     			error:function(){
     				alert("服务器繁忙，请重新尝试！");
     			}
      		}); 

        }
    })  
}else{    
    alert("浏览器暂不支持")    
}    

//开始进行人脸比对
function faceSearch(){
	var token = getCookie("search_token");
	delCookie("search_token");
	 $.ajax({
			url:"http://localhost:8080/Property/faceSearch",
			//data:"imgString="+imgData,
			data:"imgString="+imgData+"&userId="+$("#userId").val()+"&userName="+$("#userName").val(),
			type:"post",
			dataType:"jsonp",
			success:function(datas){
				flag = true;
				$("#faceToken").val(datas.data.face_token);
				alert("上传成功");
			},
			error:function(datas){
				alert("服务器繁忙，请重新尝试！");
			}
		}); 
}
