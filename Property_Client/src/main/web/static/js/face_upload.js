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
			
			
            /* 将图片保存到本地 */
             /* $.ajax({
      			url:"http://localhost:8080/Property/savePhoto",
      			data:"name="+$("#name").val()+"&photo="+photo,
      			type:"post",
      			dataType:"jsonp",
      			success:function(datas){
					alert(datas.msg);
      			},
      			error:function(datas){
      				alert("保存发生了点小错误");
      			}
      		});  */
      		

      		/* //点击按钮后弹出下载框
              var saveFile = function(data, filename){
                var save_link = document.createElementNS('http://www.w3.org/1999/xhtml', 'a');
                save_link.href = data;
                save_link.download = filename;

                var event = document.createEvent('MouseEvents');
                event.initMouseEvent('click', true, false, window, 0, 0, 0, 0, 0, false, false, false, false, 0, null);
                save_link.dispatchEvent(event);
            }; */
      		
            //saveFile(imgData,$("#name").val());  
      		  
            /* 将图片名字发送都后端 */
           $.ajax({
      			url:"http://localhost:8080/Property/facePhotoGraph",
      			data:"imgString="+imgData,
      			type:"post",
      			dataType:"jsonp",
      			success:function(datas){
      				flag = true;
      				$("#face_token").val(datas.data.face_token);
					alert("上传成功");
      			},
      			error:function(datas){
      				alert("服务器繁忙，请重新尝试！");
      			}
      		}); 

           //将获得的人脸信息录入数据库，并且上传到face++
           if(flag){  
        	   flag = false;
           }
        }
    })  
}else{    
    alert("浏览器暂不支持")    
}    

/* function saveImage (canvas, filename) {
	     var image = canvas.toDataURL('image/png').replace('image/png', 'image/octet-stream');
	     saveFile(image, filename || 'file_' + new Date().getTime() + '.png');
	         }
function saveFile(data, filename) {

	     save_link.href = data;
	     save_link.download = filename;
	 
	     var event = document.createEvent('MouseEvents');
	     event.initMouseEvent('click', true, false, window, 0, 0, 0, 0, 0, false, false, false, false, 0, null);
	     save_link.dispatchEvent(event);
	} */



//启动加载函数
$(function(){
	setUpload();
});

//自动为userId和userName赋值
function setUpload(){
	var userId = getCookie("face_upload_userId");
	delCookie("face_upload_userId");
	$.ajax({
		url:"http://localhost:8080/Property/selectUserById",
		data:"id="+userId,
		type:"post",
		dataType:"jsonp",
		success:function(datas){
			var user = datas.data.user;
			$("#userId").val(user.userId);
			$("#userName").val(user.userName);
		},
		error:function(){
			alert("自动加载函数错误！");
		}
	});
}








