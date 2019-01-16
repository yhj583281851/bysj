package com.property.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.property.bean.Car;
import com.property.bean.CarExample;
import com.property.bean.UserExample;
import com.property.bean.CarExample.Criteria;
import com.property.dao.CarMapper;


@Service
public class CarService {

	@Autowired
	CarMapper carMapper;

	/***
	 * 查询所有车辆
	 */
	public List<Car> selectOnePageCar() {
		return carMapper.selectByExample(new CarExample());
	}

	/**
	 * 按车辆id查询并返回车辆信息
	 */
	public List<Car> selectCarByCarId(String id) {
		CarExample carExample = new CarExample();
		Criteria criteria = carExample.createCriteria();
		criteria.andCarIdEqualTo(Integer.parseInt(id));
		return carMapper.selectByExample(carExample);
	}

	/**
	 * 按车辆id修改车辆信息
	 */
	public void updateCarInformation(Car car) {
		CarExample carExample = new CarExample();
		Criteria criteria = carExample.createCriteria();
		criteria.andCarIdEqualTo(car.getCarId());
		carMapper.updateByExampleSelective(car, carExample);
	}

	/***
	 * 添加车辆信息
	 */
	public int insertUser(Car car) {
		return carMapper.insert(car);
	}

	/***
	 * 根据车辆id删除车辆信息
	 */
	public int deleteUserById(int id) {
		return carMapper.deleteByPrimaryKey(id);
	}

	/***
	 * 根据checkbox和car_id批量删除车辆信息
	 */
	public void deleteUserByCheckBox(List<Integer> list) {
		CarExample carExample = new CarExample();
		Criteria criteria = carExample.createCriteria();
		criteria.andCarIdIn(list);

		carMapper.deleteByExample(carExample);
		
	}

	/***
	 * 对所有条件模糊查询
	 */
	public List<Car> selectBlurry(String string) {
		/***
		 * 
		 * 
		 * 	把ajax请求地址从196.254.151.231改成locaohost解决中文乱码问题
		 * 
		 */
		CarExample carExample = new CarExample();
		Criteria criteria1 =carExample.createCriteria();
		Criteria criteria2 = carExample.createCriteria();
		Criteria criteria3 = carExample.createCriteria();
		if(isNumber(string)) {
			criteria1.andCarIdEqualTo(Integer.parseInt(string));
			criteria2.andUserIdEqualTo(Integer.parseInt(string));
			carExample.or(criteria2);
		}else {
			String condiction = "%"+string+"%";
			criteria1.andCarBrandLike(condiction);
			criteria2.andCarColorLike(condiction);
			criteria3.andCarNumberLike(condiction);
			carExample.or(criteria2);
			carExample.or(criteria3);
		}
	
		return carMapper.selectByExample(carExample);
	}

	/***
	 * 通过userId检查该用户是否有车，并返回集合
	 */
	public List<Car> checkHaveCar(int userId) {
		CarExample carExample = new CarExample();
		Criteria criteria = carExample.createCriteria();
		criteria.andUserIdEqualTo(userId);
		return carMapper.selectByExample(carExample);
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
