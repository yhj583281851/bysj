<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>    
        <meta charset="utf-8">    
        <title>上传人脸界面</title>    
        <style>  
        video,canvas{  
            border:1px solid gray;  
            width:400px;  
            height:400px;  
            border-radius:50%;  
        }     
        </style>  
    </head>    
    <body>    
       <video autoplay style="position: absolute;left: 1%;display: none;"></video>  
        <canvas id="myCanvas" style="position: absolute;left: 50%;"></canvas>
        <input type="text" id="name" style="position:  absolute;left: 30%;top: 15%" placeholder="请填入您的账号">  
        <button id="capture" style="position: absolute;left: 30%;top: 25%">拍照上传</button>
  
       <script src="http://code.jquery.com/jquery-latest.js"></script>
        <script type="text/javascript">

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
	          			//data:"imgString="+canvas.toDataURL("image/png")+"&name="+$("#name").val(),
	          			data:"imgString="+imgData+"&name="+$("#name").val(),
	          			type:"post",
	          			dataType:"jsonp",
	          			success:function(datas){
							alert(datas.data.message);
	          			},
	          			error:function(datas){
	          				alert("传送到后端时发生了点小错误");
	          			}
	          		}); 
                  
                  
                  
                  
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
        </script>   

    </body>    

</html>