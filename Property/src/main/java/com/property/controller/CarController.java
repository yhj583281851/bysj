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
import com.property.bean.Car;
import com.property.bean.Msg;
import com.property.service.CarService;

@Controller
public class CarController {

	@Autowired
	CarService carService;
	
	/***
	 * 查询所有车辆信息
	 */
	@ResponseBody
	@RequestMapping("selectOnePageCar")
	public Msg selectOnePageCar(@RequestParam(value = "pn", defaultValue = "1") Integer pn) {
		PageHelper.startPage(pn, 5);
		List<Car> list = carService.selectOnePageCar();
		PageInfo<Car> pageInfo = new PageInfo<Car>(list);
		if (list.size() != 0) {
			return Msg.success().add("pageInfo", pageInfo);
		}
		return Msg.error();
	}
	
	/**
	 * 按车辆号查询并返回车辆信息
	 */
	@ResponseBody
	@RequestMapping("selectCarByCarId")
	public Msg selectCarByCarId(String id) {
		
		List<Car> carList = carService.selectCarByCarId(id);
		if (carList.size()!= 0) {
			Car car = carList.get(0);
			return Msg.success().add("car", car);
		}
		return Msg.error();
	}
	
	/**
	 * 按车辆id修改车辆信息
	 */
	@ResponseBody
	@RequestMapping("updateCarInformation")
	public Msg updateCarInformation(@Valid Car car,BindingResult result) {
		System.out.println("controller：" + car);
		if (result.hasErrors()) {
			Map<String, Object> map = new HashMap<String, Object>();
			List<FieldError> list = result.getFieldErrors();
			for (FieldError fieldError : list) {
				map.put(fieldError.getField(), fieldError.getDefaultMessage());
			}
			return Msg.error().add("msg", map);
		}
		carService.updateCarInformation(car);
		return Msg.success();
	}
	
	/***
	 * 增加车辆信息提交
	 */
	@ResponseBody
	@RequestMapping("uploadCarInformation")
	public Msg uploadCarInformation(@Valid Car car,BindingResult result) {
		if (result.hasErrors()) {
			Map<String, Object> map = new HashMap<String, Object>();
			List<FieldError> list = result.getFieldErrors();
			for (FieldError fieldError : list) {
				map.put(fieldError.getField(), fieldError.getDefaultMessage());
			}
			return Msg.error().add("msg", map);
		}
		carService.insertUser(car);

		return Msg.success();
	}
	
	/***
	 * 根据车辆ID删除车辆信息
	 */
	@ResponseBody
	@RequestMapping("deleteCarById")
	public Msg deleteCarById(int id) {
		int flag = carService.deleteUserById(id);
		if (flag != 0) {
			return Msg.success();
		}
		return Msg.error();
	}
	
	/***
	 * 批量删除
	 */
	@ResponseBody
	@RequestMapping("deleteCarByCheckBox")
	public Msg deleteCarByCheckBox(String ids) {
		if (ids.contains("-")) {
			List<Integer> list = new ArrayList<Integer>();
			String[] str_ids = ids.split("-");
			for (String id : str_ids) {
				list.add(Integer.parseInt(id));
			}
			carService.deleteUserByCheckBox(list);
		} else {
			carService.deleteUserById(Integer.parseInt(ids));
		}
		return Msg.success();
	}
	
	/**
	 * 按所有查询模糊查询
	 */
	@ResponseBody
	@RequestMapping("selectBlurry")
	public Msg selectBlurry(String string) {
		PageHelper.startPage(1, 10);

		List<Car> list = carService.selectBlurry(string);
		PageInfo<Car> pageInfo = new PageInfo<Car>(list);
		if (list.size() != 0) {
			return Msg.success().add("pageInfo", pageInfo);
		}
		return Msg.error();
	}
	
	
	
	
	
	
}
