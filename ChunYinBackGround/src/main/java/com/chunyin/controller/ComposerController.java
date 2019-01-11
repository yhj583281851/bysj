package com.chunyin.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.validation.FieldError;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.chunyin.bean.Composer;
import com.chunyin.bean.Msg;
import com.chunyin.bean.User;
import com.chunyin.service.ComposerService;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;

/**
 * 作曲人controller
 * @author Administrator
 *
 */
@Controller
public class ComposerController {

	@Autowired
	ComposerService composerService;
	
	/**
	 * 分页选取作曲人
	 * @param pn
	 * @return
	 */
	@ResponseBody
	@RequestMapping("selectOnePageComposer")
	public Msg selectOnePageComposer(@RequestParam(value="pn", defaultValue="1")Integer pn){
		PageHelper.startPage(pn, 8);
		
		List<Composer> list = composerService.selectOnePageComposer();
		PageInfo<Composer> pageInfo = new PageInfo<Composer>(list);
		
		if (list.size() != 0) {
			return Msg.success().add("pageInfo", pageInfo);
		}
		return Msg.error();
		
	}
	
	/**
	 * 按id查询并返回作曲人
	 */
	@ResponseBody
	@RequestMapping("selectComposerById")
	public Msg selectComposerById(int id) {
		Composer composer = composerService.selectComposerById(id);
		if (composer != null) {
			return Msg.success().add("composer", composer);
		}
		return Msg.error();
	}
	
	/**
	 * 按作曲人名查询并返回作曲人
	 */
	@ResponseBody
	@RequestMapping("selectComposerByName")
	public Msg selectComposerByName(@RequestParam(value = "pn", defaultValue = "1") Integer pn, String name) {
		PageHelper.startPage(pn, 8);

		List<Composer> list = composerService.selectComposerByName(name);
		PageInfo<Composer> pageInfo = new PageInfo<Composer>(list);
		if (list.size() != 0) {
			return Msg.success().add("pageInfo", pageInfo);
		}
		return Msg.error();
	}

	/**
	 * 按国家或地址查询并返回作曲人
	 */
	@ResponseBody
	@RequestMapping("selectComposerByAddress")
	public Msg selectComposerByAddress(@RequestParam(value = "pn", defaultValue = "1") Integer pn, String address) {
		PageHelper.startPage(pn, 8);

		List<Composer> list = composerService.selectComposerByAddress(address);
		PageInfo<Composer> pageInfo = new PageInfo<Composer>(list);
		if (list.size() != 0) {
			return Msg.success().add("pageInfo", pageInfo);
		}
		return Msg.error();
	}
	
	/**
	 * 添加作曲人
	 */
	@ResponseBody
	@RequestMapping("insertComposer")
	public Msg insertComposer(Composer composer) {
		int flag = composerService.insertComposer(composer);
		if (flag != 0) {
			return Msg.success();
		}
		return Msg.error();

	}

	/**
	 * 按id删除作曲人
	 */
	@ResponseBody
	@RequestMapping("deleteComposerById")
	public Msg deleteComposerById(int id) {
		int flag = composerService.deleteComposerById(id);
		if (flag != 0) {
			return Msg.success();
		}
		return Msg.error();
	}

	/**
	 * 根据checkbox和id删除选中作曲人
	 */
	@ResponseBody
	@RequestMapping("deleteComposerByCheckBox")
	public Msg deleteComposerByCheckBox(String ids) {
		if (ids.contains("-")) {
			List<Integer> list = new ArrayList<Integer>();
			String[] str_ids = ids.split("-");
			for (String id : str_ids) {
				list.add(Integer.parseInt(id));
			}
			composerService.deleteComposerByCheckBox(list);
		} else {
			composerService.deleteComposerById(Integer.parseInt(ids));
		}
		return Msg.success();
	}
	
	/**
	 * 按id修改作曲人信息
	 */
	@ResponseBody
	@RequestMapping("updateComposerInformation")
	public Msg updateComposerInformation(Composer composer) {
		int flag = composerService.updateComposerInformation(composer);
		if (flag != 0) {
			return Msg.success();
		}
		return Msg.error();
	}

	/**
	 * 检查重复作曲人名
	 */
	@ResponseBody
	@RequestMapping("checkComposerName")
	public Msg checkComposerName(String name) {
		int flag = composerService.checkComposerName(name);
		if (flag == 0) {// 如果未找到则账号可用，返回success
			return Msg.success().add("msg", "账户名可用");
		}
		return Msg.error().add("msg", "账户名已被占用");
	}
}
