package com.property.controller;

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

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.property.bean.Msg;
import com.property.bean.User;
import com.property.service.UserService;

@Controller
public class UserController {
	
	@Autowired
	UserService userService;
	
	/***
	 * 查询所有用户
	 */
	@ResponseBody
	@RequestMapping("selectOnePageUser")
	public Msg selectOnePageUser(@RequestParam(value = "pn", defaultValue = "1") Integer pn) {
		PageHelper.startPage(pn, 5);
		List<User> list = userService.selectOnePageUser();
		PageInfo<User> pageInfo = new PageInfo<User>(list);
		if (list.size() != 0) {
			return Msg.success().add("pageInfo", pageInfo);
		}
		return Msg.error();
	}
	
	
	/**
	 * 按用户名查询并返回用户
	 */
	@ResponseBody
	@RequestMapping("selectUserByAccount")
	public Msg selectUserByAccount(String account) {
		
		List<User> userList = userService.selectUserByAccount(account);
		if (userList.size()!= 0) {
			User user = userList.get(0);
			return Msg.success().add("user", user);
		}
		return Msg.error();
	}
	
	/**
	 * 按id查询并返回用户
	 */
	@ResponseBody
	@RequestMapping("selectUserById")
	public Msg selectUserById(int id) {
		List<User> userList = userService.selectUserById(id);
		if (userList.size()!= 0) {
			User user = userList.get(0);
			return Msg.success().add("user", user);
		}
		return Msg.error();
	}

	/**
	 * 按账户模糊查询
	 */
	@ResponseBody
	@RequestMapping("selectUserByAccountLike")
	public Msg selectUserByAccountLike(@RequestParam(value = "pn", defaultValue = "1") Integer pn, String account) {
		PageHelper.startPage(pn, 5);

		List<User> list = userService.selectUserByAccountLike(account);

		PageInfo<User> pageInfo = new PageInfo<User>(list);

		if (list.size() != 0) {
			return Msg.success().add("pageInfo", pageInfo);
		}
		return Msg.error();
	}
	
	/**
	 * 按账户模糊查询
	 */
	@ResponseBody
	@RequestMapping("selectUserBlurry")
	public Msg selectUserBlurry(String string) {
		PageHelper.startPage(1, 5);
		List<User> list = userService.selectUserBlurry(string);
		PageInfo<User> pageInfo = new PageInfo<User>(list);
		if (list.size() != 0) {
			return Msg.success().add("pageInfo", pageInfo);
		}
		return Msg.error();
	}
	
	/**
	 * 添加用户
	 */
	@ResponseBody
	@RequestMapping("insertUser")
	public Msg insertUser(@Valid User user, BindingResult result) {
		if (result.hasErrors()) {
			Map<String, Object> map = new HashMap<String, Object>();
			List<FieldError> list = result.getFieldErrors();
			for (FieldError fieldError : list) {
				map.put(fieldError.getField(), fieldError.getDefaultMessage());
			}
			return Msg.error().add("msg", map);
		}
		userService.insertUser(user);

		return Msg.success();
	}
	
	/**
	 * 按id删除用户
	 */
	@ResponseBody
	@RequestMapping("deleteUserById")
	public Msg deleteUserById(int id) {
		int flag = userService.deleteUserById(id);
		if (flag != 0) {
			return Msg.success();
		}
		return Msg.error();
	}

	/**
	 * 根据checkbox和id删除选中用户
	 */
	@ResponseBody
	@RequestMapping("deleteUserByCheckBox")
	public Msg deleteUserByCheckBox(String ids) {
		if (ids.contains("-")) {
			List<Integer> list = new ArrayList<Integer>();
			String[] str_ids = ids.split("-");
			for (String id : str_ids) {
				list.add(Integer.parseInt(id));
			}
			userService.deleteUserByCheckBox(list);
		} else {
			userService.deleteUserById(Integer.parseInt(ids));
		}
		return Msg.success();
	}

	/**
	 * 按id修改用户密码
	 */
	@ResponseBody
	@RequestMapping("updateUserPassword")
	public Msg updateUserPassword(@Valid User user,BindingResult result) {
		if (result.hasErrors()) {
			Map<String, Object> map = new HashMap<String, Object>();
			List<FieldError> list = result.getFieldErrors();
			for (FieldError fieldError : list) {
				map.put(fieldError.getField(), fieldError.getDefaultMessage());
			}
			return Msg.error().add("msg", map);
		}
		userService.updateUserPassword(user);
		return Msg.success();
	}

	/**
	 * 按id修改用户信息
	 */
	@ResponseBody
	@RequestMapping("updateUserInformation")
	public Msg updateUserInformation(@Valid User user,BindingResult result) {
		if (result.hasErrors()) {
			Map<String, Object> map = new HashMap<String, Object>();
			List<FieldError> list = result.getFieldErrors();
			for (FieldError fieldError : list) {
				map.put(fieldError.getField(), fieldError.getDefaultMessage());
			}
			return Msg.error().add("msg", map);
		}
		userService.updateUserInformation(user);
		return Msg.success();
	}

	/**
	 * 按分类查询
	 */
	@ResponseBody
	@RequestMapping("selectByClass")
	public Msg selectByClass(int type) {
		PageHelper.startPage(1, 5);

		List<User> list = userService.selectByClass(type);

		PageInfo<User> pageInfo = new PageInfo<User>(list);

		if (list.size() != 0) {
			return Msg.success().add("pageInfo", pageInfo);
		}
		return Msg.error();
	}

	
	/**
	 * 检查重复账号名
	 */
	@ResponseBody
	@RequestMapping("checkUserAccount")
	public Msg checkUserAccount(String account) {
		int flag = userService.checkUserAccount(account);
		if (flag == 0) {// 如果未找到则账号可用，返回success
			return Msg.success().add("msg", "账户名可用");
		}
		return Msg.error().add("msg", "账户名已被占用");
	}
	
	
	
	
	/***
	 * 通过用户id验证用户是否存在
	 */
	@ResponseBody
	@RequestMapping("verifyUserById")
	public Msg verifyUserById(@RequestParam(value = "userId", defaultValue = "0") Integer userId) {
		List<User> users = userService.verifyUserById(userId);
		if (users.size() != 0) {
			User user = users.get(0);
			return Msg.success().add("userName", user.getUserName());
		}
		return Msg.error();
	}
	
	/***
	 * 通过用户name验证用户是否存在
	 */
	@ResponseBody
	@RequestMapping("verifyUserByName")
	public Msg verifyUserByName(@RequestParam(value = "userName", defaultValue = "") String userName) {
		List<User> users = userService.verifyUserByName(userName);
		if (users.size() != 0) {
			User user = users.get(0);
			return Msg.success().add("userId", user.getUserId());
		}
		return Msg.error();
	}
	
	
}
