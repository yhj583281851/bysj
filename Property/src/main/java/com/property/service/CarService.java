package com.property.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.property.bean.Car;
import com.property.bean.CarExample;
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
	
}
