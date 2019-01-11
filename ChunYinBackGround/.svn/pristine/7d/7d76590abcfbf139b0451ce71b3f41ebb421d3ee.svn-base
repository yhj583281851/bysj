package com.chunyin.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.chunyin.bean.Class;
import com.chunyin.bean.ClassExample;
import com.chunyin.bean.ClassExample.Criteria;
import com.chunyin.dao.ClassMapper;

@Service
public class ClassService {

	@Autowired
	ClassMapper classMapper;

	/**
	 * 查询所有类别
	 * 
	 * @return
	 */
	public List<Class> selectAllClass() {
		return classMapper.selectByExample(new ClassExample());
	}
	
	/**
	 * 按id查询类别
	 */
	public Class SelectClassById(int id) {
		return classMapper.selectByPrimaryKey(id);
	}
	
	/**
	 * 添加类别
	 */
	public int insertClass(String name) {
		Class record = new Class();
		record.setClassName(name);
		return classMapper.insert(record);
	}
	
	/**
	 * 按id删除类别
	 */
	public int deleteClassById(int id) {
		return classMapper.deleteByPrimaryKey(id);
	}
	
	/**
	 * 按id修改类名
	 */
	public int updateClassById(int id, String name) {
		Class record = classMapper.selectByPrimaryKey(id);
		record.setClassName(name);
		return classMapper.updateByPrimaryKey(record);
	}

	
}
