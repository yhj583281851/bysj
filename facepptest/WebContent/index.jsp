<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>    
        <meta charset="utf-8">    
        <title>假装这是注册页面</title>    
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
      <!--   <input type="file" name="file"  style="position: absolute;left: 30%;top: 35%" >
        <button style="position: absolute;left: 30%;top: 45%">图片上传</button>
 -->   
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
                    //alert(video.clientHeight)  
                    //canvas.width = video.clientWidth;  
                    //canvas.height= video.clientHeight;  
                    canvas.width = 800;  
                    canvas.height = 800;  
                    var context = canvas.getContext('2d');  
                    imgString = canvas.toDataURL("image/png")
                    context.drawImage(video,20,20)  

                    var info = {
                        name: $("#name").val(),
                        imgString: canvas.toDataURL("image/png")
                      }

                    $.post("/face/photograph",info,function(data){

                            alert(data.message)

                  },"json") 
                }  
            })  
        }else{    
            alert("浏览器暂不支持")    
        }    
        </script>   

    </body>    

</html>