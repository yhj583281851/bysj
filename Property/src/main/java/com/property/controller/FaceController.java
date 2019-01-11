package com.property.controller;

import java.io.File;
import java.io.IOException;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.property.bean.FaceUtil;
import com.property.bean.Msg;
import com.property.service.FaceService;

import net.sf.json.JSONObject;

@Controller
public class FaceController {
	
	@Autowired
	FaceService faceService;
	
	/***
	 * 获取拍照人脸
	 * @throws IOException 
	 */
	@ResponseBody
	@RequestMapping("facePhotoGraph")
	//public Msg getFace(@RequestParam(value = "imgString") String imgString,(value = "name") String name) {
	public Msg getFace(@RequestParam(value = "imgString", defaultValue = "null")String imgString,@RequestParam(value="name",defaultValue="null")String name) throws IOException {
		System.out.println("进入facePhotoGraph");
		System.out.println("name:"+name);
		System.out.println(imgString);
		//data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAAyAAAAMgCAYAAADbcAZoAAAgAElEQVR4Xu3

		String str = FaceUtil.checkFace(imgString);
        JSONObject json = JSONObject.fromObject(str);
        try {
        	/*
        	{
				"time_used": 118,
				"error_message": "IMAGE_ERROR_UNSUPPORTED_FORMAT: image_file",
				"request_id": "1545378341,ea597c49-3271-48ce-9ba5-4e96bb5cd4e4"
			}
        	*/
            String faces = json.getString("faces");
            if("[]".equals(faces)) {
                //return new JsonResult("0", "对不起，您上传的不是用户头像或者照片质量不达标，请重新上传！", null);
            	System.out.println("上传失败");
            	return Msg.error();
            }
            System.out.println("上传成功");
            /*JSONObject josnToken = JSONObject.fromObject(faces.substring(1, faces.length()-1));
            String token = josnToken.getString("face_token");
            FaceUser user = new FaceUser();
            user.setName(name);
            user.setFaceToken(token);
            faceService.add(user);*/
       } catch (Exception e) {
           // TODO: handle exception   
            e.printStackTrace();
            //return new JsonResult("0", "系统繁忙，请稍后重试！", null);
            return Msg.error();
       }
      //return new JsonResult("1", "上传成功，请登录！", null);
      
		return Msg.success();
	}
	
	/***
	 * 保存图片 
	 */
	/*@ResponseBody
	@RequestMapping("savePhoto")
	public void savePhoto(@RequestParam(value="photo",defaultValue="null")String photo,@RequestParam(value="name",defaultValue="null")String name) {
		if(name!=null) {
			String savePath = System.getProperty("user.dir") + "\\face_images";
			try {
				FileStream fs = File.Create(savePath + "/" + name + ".png");
				byte[] bytes = Convert.fFromBase64String(photo);
				
				fs.Write(bytes,0,bytes.length);
				fs.Close();
			}catch(Exception ex) {
				System.out.println(ex);
			}
		}
	}*/
	
	
	
	
	
	
	
}
