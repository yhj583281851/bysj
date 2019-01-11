package com.chunyin.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Properties;

import javax.mail.Address;
import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.validation.FieldError;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.chunyin.bean.Msg;
import com.chunyin.bean.UserWithBLOBs;
import com.chunyin.service.UserService;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;

/**
 * 用户controller
 * 
 * @author Administrator
 *
 */
@Controller
public class UserController {

	@Autowired
	UserService userService;

	/**
	 * 查询单个页面用户
	 */
	@ResponseBody
	@RequestMapping("selectOnePageUser")
	public Msg selectOnePageUser(@RequestParam(value = "pn", defaultValue = "1") Integer pn) {
		PageHelper.startPage(pn, 5);

		List<UserWithBLOBs> list = userService.selectOnePageUser();

		PageInfo<UserWithBLOBs> pageInfo = new PageInfo<UserWithBLOBs>(list);

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
		
		List<UserWithBLOBs> userList = userService.selectUserByAccount(account);
		if (userList.size()!= 0) {
			UserWithBLOBs user = userList.get(0);
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
		List<UserWithBLOBs> userList = userService.selectUserById(id);
		if (userList.size()!= 0) {
			UserWithBLOBs user = userList.get(0);
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

		List<UserWithBLOBs> list = userService.selectUserByAccountLike(account);

		PageInfo<UserWithBLOBs> pageInfo = new PageInfo<UserWithBLOBs>(list);

		if (list.size() != 0) {
			return Msg.success().add("pageInfo", pageInfo);
		}
		return Msg.error();
	}
	
	/**
	 * 用户登录
	 */
	@ResponseBody
	@RequestMapping("userLogin")
	public Msg userLogin(String account, String password) {
		List<UserWithBLOBs> userList = userService.userLogin(account, password);
		if (userList.size() != 0) {
			int id = userList.get(0).getUserId();
			return Msg.success().add("id", id);
		}
		return Msg.error();
	}

	/**
	 * 添加用户
	 */

	@ResponseBody
	@RequestMapping("insertUser")
	public Msg insertUser(@Valid UserWithBLOBs user, BindingResult result) {
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
	public Msg updateUserPassword(@Valid UserWithBLOBs user,BindingResult result) {
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
	public Msg updateUserInformation(@Valid UserWithBLOBs user,BindingResult result) {
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
	
	/**
	 * 验证邮箱和账号
	 */
	@ResponseBody
	@RequestMapping("checkUserAccountAndEmail")
	public Msg checkUserAccountAndEmail(String account,String email){
		int flag = userService.checkUserAccountAndEmail(account,email);
		if(flag == 0){
			return Msg.error().add("msg", "账号或邮箱不存在");
		}
		Properties props = new Properties();
		props.setProperty("mail.debug", "true");//调试模式发送
		props.setProperty("mail.smtp.auth", "true");
		props.setProperty("mail.host", "smtp.qq.com");
		props.setProperty("mail.transport.protocol", "smtp");
		Session session = Session.getInstance(props);

		Message msg = new MimeMessage(session);
		String randomNum = createRandomNum(6);
		Transport transport = null;
		try {
			msg.setSubject("醇音音乐平台");
			msg.setFrom(new InternetAddress("704451646@qq.com"));//设置发件人
			
			transport = session.getTransport();
			transport.connect("704451646@qq.com", "qcgrdcinrbibbegj");//设置发件人在该邮箱主机上的用户名密码
		
			msg.setText("验证码："+randomNum+"");
			transport.sendMessage(msg, new Address[] {new InternetAddress(email)});
			transport.close();
		} catch (MessagingException e) {
			e.printStackTrace();
		}
		
        List<UserWithBLOBs> userList = userService.selectUserByAccount(account);
        if(userList.size()==0){
        	return Msg.error();
        }
        int id = userList.get(0).getUserId();
        return Msg.success().add("code", randomNum).add("userId", id);
	}
	
	 /**
     * 生成随机数
     * @param num 位数
     * @return
     */
    public static String createRandomNum(int num){
     String randomNumStr = "";
     for(int i = 0; i < num;i ++){
      int randomNum = (int)(Math.random() * 10);
      randomNumStr += randomNum;
     }
     return randomNumStr;
    }
}
