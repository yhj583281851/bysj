package com.property.controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.property.bean.Face;
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
		String token;
		System.out.println("进入facePhotoGraph");
		System.out.println("name:"+name);
		//解决因为跨域传值过程中“+”被替换成“ ”的问题
		imgString = imgString.replace("＋", "+");
		//System.out.println(imgString);
		//data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAAyAAAAMgCAYAAADbcAZoAAAgAElEQVR4Xu3

		String str = FaceUtil.checkFace(imgString);
        JSONObject json = JSONObject.fromObject(str);
        try {    	
        	/*{
			{
				"image_id": "b0XqljbCONqbd/5Iy60C2g==",
				"request_id": "1547608002,a6cb47c9-a055-45a3-b3e9-67c59deb5ccf",
				"time_used": 375,
				"faces": [{
					"face_rectangle": {
						"width": 316,
						"top": 190,
						"left": 137,
						"height": 316
					},
					"face_token": "1fa26d8f0bb5ab30e721f323b08e1085"
				}]
			}
			*/
        	
            String faces = json.getString("faces");
            if("[]".equals(faces)) {
            	System.out.println("上传失败，上传的不是用户头像或者图片质量不达标，请重新上传！");
            	return Msg.error();
            }
            System.out.println("上传成功");
            JSONObject josnToken = JSONObject.fromObject(faces.substring(1, faces.length()-1));
            token = josnToken.getString("face_token");
            //录入进数据库
/*            FaceUser user = new FaceUser();
            user.setName(name);
            user.setFaceToken(token);
            faceService.add(user);*/
       } catch (Exception e) {
            e.printStackTrace();
            return Msg.error();
       }
		return Msg.success().add("face_token", token);
	}
	
	/***
	 * 查询所有人脸信息
	 */
	@ResponseBody
	@RequestMapping("selectOnePageFace")
	public Msg selectOnePageFace(@RequestParam(value = "pn", defaultValue = "1") Integer pn) {
		PageHelper.startPage(pn, 10);
		List<Face> list = faceService.selectOnePageFace();
		PageInfo<Face> pageInfo = new PageInfo<Face>(list);
		if (list.size() != 0) {
			return Msg.success().add("pageInfo", pageInfo);
		}
		return Msg.error();
	}
	
	/**
	 * 按人脸号查询并返回人脸信息
	 */
	@ResponseBody
	@RequestMapping("selectFaceByFaceId")
	public Msg selectCarByCarId(String id) {
		
		List<Face> faceList = faceService.selectFaceByFaceId(id);
		if (faceList.size()!= 0) {
			Face face = faceList.get(0);
			return Msg.success().add("face", face);
		}
		return Msg.error();
	}
	
	/**
	 * 根据userId检查用户是否录入人脸信息
	 */
	@ResponseBody
	@RequestMapping("checkHaveFace")
	public Msg checkHaveFace(int userId) {
		PageHelper.startPage(1, 10);
		List<Face> list = faceService.checkHaveFace(userId);
		return Msg.success().add("facesize",list.size());
	}
	
	/**
	 * 按id删除人脸信息
	 */
	@ResponseBody
	@RequestMapping("deleteFaceById")
	public Msg deleteUserById(int id) {
		int flag = faceService.deleteFaceById(id);
		if (flag != 0) {
			return Msg.success();
		}
		return Msg.error();
	}
	
	/***
	 * 批量删除
	 */
	@ResponseBody
	@RequestMapping("deleteFaceByCheckBox")
	public Msg deleteFaceByCheckBox(String ids) {
		if (ids.contains("-")) {
			List<Integer> list = new ArrayList<Integer>();
			String[] str_ids = ids.split("-");
			for (String id : str_ids) {
				list.add(Integer.parseInt(id));
			}
			faceService.deleteFaceByCheckBox(list);
		} else {
			faceService.deleteFaceById(Integer.parseInt(ids));
		}
		return Msg.success();
	}
	
	/***
	 * 模糊查询
	 */
	@ResponseBody
	@RequestMapping("selectFaceBlurry")
	public Msg selectFaceBlurry(String string) {
		PageHelper.startPage(1, 10);
		List<Face> list = faceService.selectFaceBlurry(string);
		PageInfo<Face> pageInfo = new PageInfo<Face>(list);
		if (list.size() != 0) {
			return Msg.success().add("pageInfo", pageInfo);
		}
		return Msg.error();
	}
	
	/***
	 * 根据userId查询
	 */
	@ResponseBody
	@RequestMapping("selectFaceByUserId")
	public Msg selectFaceByUserId(String userId) {
		PageHelper.startPage(1, 10);
		List<Face> list = faceService.selectFaceByUserId(userId);
		PageInfo<Face> pageInfo = new PageInfo<Face>(list);
		if (list.size() != 0) {
			return Msg.success().add("pageInfo", pageInfo);
		}
		return Msg.error();
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
