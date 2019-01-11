package com.chunyin.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.chunyin.bean.Sheet;
import com.chunyin.bean.SheetExample;
import com.chunyin.bean.SheetExample.Criteria;
import com.chunyin.bean.Song;
import com.chunyin.bean.SongExample;
import com.chunyin.dao.SheetMapper;
import com.chunyin.dao.SongMapper;

@Service
public class SheetService {

	@Autowired
	SheetMapper sheetMapper;
	@Autowired
	SongMapper songMapper;
	
	/**
	 * 按歌单id查询歌单
	 * @param sheetId
	 * @param userId
	 * @return
	 */
	public Sheet selectSheetBySheetId(int sheetId) {
		SheetExample example = new SheetExample();
		Criteria criteria = example.createCriteria();
		criteria.andSheetIdEqualTo(sheetId);
		List<Sheet> list = sheetMapper.selectByExampleWithBLOBs(example);
		return list.get(0);
	}
	
	/**
	 * 按用户id查询歌单列表
	 */
	public List<Sheet> selectSheetsByUserId(int userId) {
		SheetExample example = new SheetExample();
		Criteria criteria = example.createCriteria();
		criteria.andUserIdEqualTo(userId);
		return sheetMapper.selectByExampleWithBLOBs(example);
	}

	/**
	 * 查询歌单的歌曲
	 * @param list
	 * @return
	 */
	public List<Song> selectSheetSongByIds(List<Integer> list) {
		SongExample example = new SongExample();
		com.chunyin.bean.SongExample.Criteria criteria = example.createCriteria();
		criteria.andSongIdIn(list);
		return songMapper.selectByExample(example);
	}

	/**
	 * 按歌单名模糊查询歌单
	 * @param name
	 * @return
	 */
	public List<Sheet> selectSheetsByName(String name) {
		SheetExample example = new SheetExample();
		Criteria criteria = example.createCriteria();
		String Name = "%"+name+"%";
		criteria.andSheetNameLike(Name);
		return sheetMapper.selectByExampleWithBLOBs(example);
	}

	/**
	 * 新建歌单
	 */
	public int insertNewSheet(String name, int userId) {
		Sheet record = new Sheet();
		record.setUserId(userId);
		record.setSheetName(name);
		int flag = sheetMapper.insertSelective(record);
		if(flag == 1){
			SheetExample example = new SheetExample();
			Criteria criteria = example.createCriteria();
			criteria.andUserIdEqualTo(userId).andSheetNameEqualTo(name);
			return sheetMapper.selectByExampleWithBLOBs(example).get(0).getSheetId();
		}
		return 0;
	}

	/**
	 * 修改歌单名字
	 * @param name
	 * @param id
	 * @return
	 */
	public int updateSheetNameById(String name, int id) {
		SheetExample example = new SheetExample();
		Criteria criteria = example.createCriteria();
		criteria.andSheetIdEqualTo(id);
		List<Sheet> list = sheetMapper.selectByExampleWithBLOBs(example);
		if(list.isEmpty()){
			return 0;
		}
		Sheet sheet = list.get(0);
		sheet.setSheetName(name);
		return sheetMapper.updateByPrimaryKeyWithBLOBs(sheet);
	}

	/**
	 * 添加歌曲到歌单
	 */
	public int updateSheetSongsBySheet(Sheet sheet) {
		return sheetMapper.updateByPrimaryKeyWithBLOBs(sheet);
	}

	/**
	 * 删除歌单
	 */
	public int deleteSheet(int sheetId) {
		SheetExample example = new SheetExample();
		Criteria criteria = example.createCriteria();
		criteria.andSheetIdEqualTo(sheetId);
		return sheetMapper.deleteByExample(example);
	}

	/**
	 * 按id查询收藏歌单列表
	 * @param list
	 * @return
	 */
	public List<Sheet> selectSheetsBySheetIds(List<Integer> list) {
		SheetExample example = new SheetExample();
		Criteria criteria = example.createCriteria();
		criteria.andSheetIdIn(list);
		return sheetMapper.selectByExampleWithBLOBs(example);
	}



}
