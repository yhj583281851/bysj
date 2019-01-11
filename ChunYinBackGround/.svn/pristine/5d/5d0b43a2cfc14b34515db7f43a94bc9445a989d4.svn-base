package com.chunyin.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.chunyin.bean.Msg;
import com.chunyin.bean.Class;
import com.chunyin.service.ClassService;
import com.fasterxml.jackson.databind.util.JSONPObject;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;

/**
 * 类别controller
 * 
 * @author Administrator
 *
 */
@Controller
public class ClassController {

	@Autowired
	ClassService classService;

	/**
	 * 查询所有类别
	 */
	@ResponseBody
	@RequestMapping("selectAllClass")
	public Msg selectAllClass(@RequestParam(value = "pn", defaultValue = "1") Integer pn) {
		PageHelper.startPage(pn, 20);

		List<Class> list = classService.selectAllClass();
		PageInfo<Class> pageInfo = new PageInfo<Class>(list);
		if (list.size() != 0) {
			return Msg.success().add("pageInfo", pageInfo);
		}
		return Msg.error();
	}

	/**
	 * 按id查询类别
	 */
	@ResponseBody
	@RequestMapping("SelectClassById")
	public Msg SelectClassById(int id) {
		Class record = classService.SelectClassById(id);
		if (record != null) {
			return Msg.success().add("Class", record);
		}
		return Msg.error();
	}
	
	/**
	 * 添加类别
	 */
	@ResponseBody
	@RequestMapping("insertClass")
	public Msg insertClass(String name) {
		int flag = classService.insertClass(name);
		if (flag != 0) {
			return Msg.success();
		}
		return Msg.error();
	}
	
	/**
	 * 按id删除类别
	 */
	@ResponseBody
	@RequestMapping("deleteClassById")
	public Msg deleteClassById(int id) {
		int flag = classService.deleteClassById(id);
		if (flag != 0) {
			return Msg.success();
		}
		return Msg.error();
	}
	
	/**
	 * 按id修改类名
	 */
	@ResponseBody
	@RequestMapping("updateClassById")
	public Msg updateClassById(int id, String name) {
		int flag = classService.updateClassById(id, name);
		if (flag != 0) {
			return Msg.success();
		}
		return Msg.error();
	}
	
}
