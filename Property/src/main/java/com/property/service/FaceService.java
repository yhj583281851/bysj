package com.property.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.property.bean.Face;
import com.property.bean.FaceExample;
import com.property.bean.FaceExample.Criteria;
import com.property.dao.FaceMapper;

@Service
public class FaceService {

	@Autowired
	FaceMapper faceMapper;
	
	
	/***
	 * 查询所有人脸信息
	 */
	public List<Face> selectOnePageFace() {
		return faceMapper.selectByExample(new FaceExample());
	}
	
	/***
	 * 根据userId检查数据库中是否录入人脸信息
	 */
	public List<Face> checkHaveFace(int userId) {
		FaceExample faceExample = new FaceExample();
		Criteria criteria = faceExample.createCriteria();
		criteria.andUserIdEqualTo(userId);
		return faceMapper.selectByExample(faceExample);
	}

	/**
	 * 按人脸号查询并返回人脸信息
	 */
	public List<Face> selectFaceByFaceId(String id) {
		FaceExample faceExample = new FaceExample();
		Criteria criteria = faceExample.createCriteria();
		criteria.andFaceIdEqualTo(Integer.parseInt(id));
		return faceMapper.selectByExample(faceExample);
	}

	/**
	 * 按id删除人脸信息
	 */
	public int deleteFaceById(int id) {
		return faceMapper.deleteByPrimaryKey(id);
	}

	/***
	 * 批量删除
	 */
	public void deleteFaceByCheckBox(List<Integer> list) {
		FaceExample faceExample = new FaceExample();
		Criteria criteria = faceExample.createCriteria();
		criteria.andFaceIdIn(list);

		faceMapper.deleteByExample(faceExample);
		
	}

	/***
	 * 模糊查询
	 */
	public List<Face> selectFaceBlurry(String string) {
		FaceExample faceExample = new FaceExample();
		Criteria criteria = faceExample.createCriteria();
		if(isNumber(string)) {
			criteria.andUserIdEqualTo(Integer.parseInt(string));
		}else {
			criteria.andUserNameLike("%"+string+"%");
		}
		return faceMapper.selectByExample(faceExample);
	}
	
	/***
	 * 判断字符串是否为数字
	 */
	public static boolean isNumber(String string) {
		for(int i=0;i<string.length();i++) {
			if(!Character.isDigit(string.charAt(i))) {
				return false;
			}
		}
		return true;
	}

	/***
	 * 根据userId查询
	 */
	public List<Face> selectFaceByUserId(String string) {
		FaceExample faceExample = new FaceExample();
		Criteria criteria = faceExample.createCriteria();
		criteria.andUserIdEqualTo(Integer.parseInt(string));
		return faceMapper.selectByExample(faceExample);
	}
	
	/***
	 * 将人脸信息录入数据库
	 */
	public int addFace(String userId, String userName, String token) {
		Face face = new Face();
		face.setUserId(Integer.parseInt(userId));
		face.setUserName(userName);
		face.setFaceToken(token);
		return faceMapper.insert(face);
	}

	/***
	 * 根据传入的userId删除原有的face数据
	 */
	public int deleteFaceByUserId(String userId) {
		// TODO Auto-generated method stub
		return 0;
	}
	
	
	
}
