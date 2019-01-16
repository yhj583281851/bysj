package com.property.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;


import com.property.bean.User;
import com.property.bean.UserExample;
import com.property.bean.UserExample.Criteria;
import com.property.dao.UserMapper;

@Service
public class UserService {
	
	@Autowired
	UserMapper userMapper;
	
	
	/***
	 * 查询所有用户
	 */
	public List<User> selectOnePageUser() {
		return userMapper.selectByExample(new UserExample());
	}

	/**
	 * 按用户名查询并返回用户
	 * @param account
	 * @return
	 */
	public List<User> selectUserByAccount(String account) {
		UserExample userExample = new UserExample();
		Criteria criteria = userExample.createCriteria();
		criteria.andUserAccountEqualTo(account);
		return userMapper.selectByExample(userExample);
	}

	/**
	 * 按id查询并返回用户
	 */
	public List<User> selectUserById(int id) {
		UserExample userExample = new UserExample();
		Criteria criteria = userExample.createCriteria();
		criteria.andUserIdEqualTo(id);
		return userMapper.selectByExample(userExample);
	}

	/**
	 * 按账户模糊查询
	 */
	public List<User> selectUserByAccountLike(String account) {
		UserExample userExample = new UserExample();
		Criteria criteria = userExample.createCriteria();
		String Account = "%"+account+"%";
		criteria.andUserAccountLike(Account);
		return userMapper.selectByExample(userExample);
	}
	
	/**
	 * 用户登录
	 */
	public List<User> userLogin(String account, String password) {
		UserExample userExample = new UserExample();
		Criteria criteria = userExample.createCriteria();
		criteria.andUserAccountEqualTo(account).andUserPasswordEqualTo(password);
		
		return userMapper.selectByExample(userExample);
	}

	/**
	 * 添加用户
	 */
	public int insertUser(User user) {
		return userMapper.insert(user);
	}

	/**
	 * 按id删除员工
	 */
	public int deleteUserById(int id) {
		return userMapper.deleteByPrimaryKey(id);
	}

	/**
	 * 检查重复账号名
	 */
	public int checkUserAccount(String account) {
		UserExample userExample = new UserExample();
		Criteria criteria = userExample.createCriteria();
		criteria.andUserAccountEqualTo(account);

		return userMapper.countByExample(userExample);
	}

	/**
	 * 按id修改用户密码
	 */
	public int updateUserPassword(User user) {
		UserExample userExample = new UserExample();
		Criteria criteria = userExample.createCriteria();
		criteria.andUserIdEqualTo(user.getUserId());
		User newUser = userMapper.selectByExample(userExample).get(0);
		newUser.setUserPassword(user.getUserPassword());

		return userMapper.updateByPrimaryKey(newUser);
	}

	/**
	 * 按id修改用户信息
	 */
	public int updateUserInformation(User user) {
		UserExample userExample = new UserExample();
		Criteria criteria = userExample.createCriteria();
		criteria.andUserIdEqualTo(user.getUserId());
		User oldUser = userMapper.selectByExample(userExample).get(0);
		String password = oldUser.getUserPassword();
		User newUser = user;
		newUser.setUserPassword(password);

		return userMapper.updateByPrimaryKey(newUser);
	}

	/**
	 * 根据checkbox和id删除选中用户
	 */
	public void deleteUserByCheckBox(List<Integer> list) {
		UserExample userExample = new UserExample();
		Criteria criteria = userExample.createCriteria();
		criteria.andUserIdIn(list);

		userMapper.deleteByExample(userExample);
	}
	
	/**
	 * 根据userId检查该用户是否存在
	 */
	public List<User> verifyUserById(int userId) {
		UserExample userExample = new UserExample();
		Criteria criteria = userExample.createCriteria();
		criteria.andUserIdEqualTo(userId);
		return userMapper.selectByExample(userExample);
	}
	
	/**
	 * 根据userName检查该用户是否存在
	 */
	public List<User> verifyUserByName(String userName) {
		UserExample userExample = new UserExample();
		Criteria criteria = userExample.createCriteria();
		criteria.andUserNameEqualTo(userName);
		return userMapper.selectByExample(userExample);
	}
	
	/***
	 * 分类查询
	 */
	public List<User> selectByClass(int type) {
		UserExample userExample = new UserExample();
		Criteria criteria = userExample.createCriteria();
		criteria.andUserTypeEqualTo(type);
		return userMapper.selectByExample(userExample);
	}

	/***
	 * 按照所有条件模糊查询
	 */
	public List<User> selectUserBlurry(String condiction) {
		UserExample userExample = new UserExample();
		Criteria criteria1 = userExample.createCriteria();
		Criteria criteria2 = userExample.createCriteria();
		Criteria criteria3 = userExample.createCriteria();
		Criteria criteria4 = userExample.createCriteria();
		//判断传入的字符串是否为纯数字
		if(isNumber(condiction)) {
			//数字
			criteria1.andUserIdEqualTo(Integer.parseInt(condiction));
			criteria2.andUserAgeEqualTo(Integer.parseInt(condiction));
			criteria3.andUserPhoneEqualTo(Integer.parseInt(condiction));
			userExample.or(criteria2);
			userExample.or(criteria3);
		}else {
			//字符串
			String string = "%"+condiction+"%";
			criteria1.andUserAccountLike(string);
			criteria2.andUserSexLike(string);
			criteria3.andUserAddressLike(string);
			criteria4.andUserNameLike(string);
			userExample.or(criteria2);
			userExample.or(criteria3);
			userExample.or(criteria4);
		}
		return userMapper.selectByExample(userExample);
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
}