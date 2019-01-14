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
		System.out.println("service:"+car);
		CarExample carExample = new CarExample();
		Criteria criteria = carExample.createCriteria();
		criteria.andCarIdEqualTo(car.getCarId());
		carMapper.updateByExampleSelective(car, carExample);

		//return CarMapper.updateByPrimaryKey(car);
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
		CarExample carExample = new CarExample();
		
		String condiction = "%"+string+"%";
		
		
		
		System.out.println(condiction);
		
	
		
		Criteria criteria1 =carExample.createCriteria();
		criteria1.andCarBrandLike(condiction);		
		Criteria criteria2 = carExample.createCriteria();
		criteria2.andCarColorLike(condiction);
		Criteria criteria3 = carExample.createCriteria();
		criteria3.andCarNumberLike(condiction);
		Criteria criteria4 = carExample.createCriteria();
		
		carExample.or(criteria2);
		carExample.or(criteria3);
		
		


		
		
		return carMapper.selectByExample(carExample);
		
	}
	
}
