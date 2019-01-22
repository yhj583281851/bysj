<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>    
        <meta charset="utf-8">    
        <title>行人入门</title>    
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

        <button id="capture" style="position: absolute;left: 30%;top: 25%">点击进行拍照验证</button>
        <li id="face_token" name="face_token">123321123212</li>
  
       <script src="http://code.jquery.com/jquery-latest.js"></script>
       <script src="static/js/cookie.js"></script>
        <script src="static/js/people_access.js"></script>  

    </body>    

</html>