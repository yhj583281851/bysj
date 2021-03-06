package com.chunyin.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.chunyin.bean.Composer;
import com.chunyin.bean.ComposerExample;
import com.chunyin.bean.ComposerExample.Criteria;
import com.chunyin.bean.Song;
import com.chunyin.bean.UserExample;
import com.chunyin.dao.ComposerMapper;



@Service
public class ComposerService {

	@Autowired
	ComposerMapper composerMapper;

	/**
	 * 分页选取作曲人
	 * @return
	 */
	public List<Composer> selectOnePageComposer() {
		return composerMapper.selectByExampleWithBLOBs(new ComposerExample());
	}

	/**
	 * 按id查询并返回作曲人
	 */
	public Composer selectComposerById(int id) {
		ComposerExample example = new ComposerExample();
		Criteria criteria = example.createCriteria();
		criteria.andComposerIdEqualTo(id);
		return composerMapper.selectByExampleWithBLOBs(example).get(0);
	}

	/**
	 * 按作曲人名查询并返回作曲人
	 */
	public List<Composer> selectComposerByName(String name) {
		ComposerExample example = new ComposerExample();
		Criteria criteria = example.createCriteria();
		String Name = "%"+name+"%";
		criteria.andComposerNameLike(Name);
		return composerMapper.selectByExampleWithBLOBs(example);
	}

	/**
	 * 按国家或地址查询并返回作曲人
	 */
	public List<Composer> selectComposerByAddress(String address) {
		ComposerExample example = new ComposerExample();
		Criteria criteria = example.createCriteria();
		String Address = "%"+address+"%";
		criteria.andComposerAddressLike(Address);
		return composerMapper.selectByExampleWithBLOBs(example);
	}

	/**
	 * 添加作曲人
	 */
	public int insertComposer(Composer composer) {
		return composerMapper.insert(composer);
	}

	/**
	 * 按id删除作曲人
	 */
	public int deleteComposerById(int id) {
		return composerMapper.deleteByPrimaryKey(id);
	}

	/**
	 * 根据checkbox和id删除选中作曲人
	 */
	public void deleteComposerByCheckBox(List<Integer> list) {
		ComposerExample example = new ComposerExample();
		Criteria criteria = example.createCriteria();
		criteria.andComposerIdIn(list);
		composerMapper.deleteByExample(example);
	}

	/**
	 * 按id修改作曲人信息
	 */
	public int updateComposerInformation(Composer composer) {
		return composerMapper.updateByPrimaryKeyWithBLOBs(composer);
	}

	/**
	 * 检查重复作曲人名
	 */
	public int checkComposerName(String name) {
		ComposerExample example = new ComposerExample();
		Criteria criteria = example.createCriteria();
		criteria.andComposerNameEqualTo(name);
		return composerMapper.countByExample(example);
	}
}
