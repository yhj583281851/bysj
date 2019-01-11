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
	 * 按点击数和类别class查询并排序歌曲
	 */
	public List<User> selectUserByClass(int id) {
		UserExample userExample = new UserExample();
		Criteria criteria = userExample.createCriteria();
		criteria.andUserTypeEqualTo(id);
		return userMapper.selectByExample(userExample);
	}

	
}