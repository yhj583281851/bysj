package com.chunyin.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.chunyin.bean.Sheet_comments;
import com.chunyin.bean.Sheet_commentsExample;
import com.chunyin.bean.Sheet_commentsExample.Criteria;
import com.chunyin.bean.Song_comments;
import com.chunyin.bean.Song_commentsExample;
import com.chunyin.dao.Sheet_commentsMapper;

@Service
public class Sheet_commentsService {

	@Autowired
	Sheet_commentsMapper sheet_commentsMapper;

	/**
	 * 增添新评论
	 */
	public int insertSheetComments(Sheet_comments sheet_comments) {
		return sheet_commentsMapper.insert(sheet_comments);
	}

	/**
	 * 增添回复评论
	 */
	public Sheet_comments insertSheetCommentsAnswer(Sheet_comments sheet_comments) {
		sheet_commentsMapper.insert(sheet_comments);
		Sheet_commentsExample example = new Sheet_commentsExample();
		Criteria criteria = example.createCriteria();
		criteria.andToUidEqualTo(sheet_comments.getToUid());
		return sheet_commentsMapper.selectByExampleWithBLOBs(example).get(0);
	}

	/**
	 * 通过歌单id查询歌单评论
	 */
	public List<Sheet_comments> selectSheetCommentsBySheetId(int sheetId) {
		Sheet_commentsExample example = new Sheet_commentsExample();
		Criteria criteria = example.createCriteria();
		criteria.andSheetIdEqualTo(sheetId);
		example.setOrderByClause("comment_id desc");
		return sheet_commentsMapper.selectByExampleWithBLOBs(example);
	}

	/**
	 * 通过用户id查询歌单评论
	 */
	public List<Sheet_comments> selectSheetCommentsByUserId(int userId) {
		Sheet_commentsExample example = new Sheet_commentsExample();
		Criteria criteria = example.createCriteria();
		criteria.andUserIdEqualTo(userId);
		example.setOrderByClause("comment_id desc");
		return sheet_commentsMapper.selectByExampleWithBLOBs(example);
	}

	/**
	 * 通过评论id查询歌单评论
	 */
	public Sheet_comments selectSheetCommentsByCommentId(int commentId) {
		Sheet_commentsExample example = new Sheet_commentsExample();
		Criteria criteria = example.createCriteria();
		criteria.andCommentIdEqualTo(commentId);
		return sheet_commentsMapper.selectByExampleWithBLOBs(example).get(0);
	}

	/**
	 * 删除评论
	 */
	public int deleteSheetCommentsByCommentId(int commentId) {
		Sheet_commentsExample example = new Sheet_commentsExample();
		Criteria criteria = example.createCriteria();
		criteria.andCommentIdEqualTo(commentId);
		return sheet_commentsMapper.deleteByExample(example);
	}
	
	/**
	 * 根据checkbox和id删除选中评论
	 */
	public void deleteSheetCommentsByCheckBox(List<Integer> list) {
		Sheet_commentsExample example = new Sheet_commentsExample();
		Criteria criteria = example.createCriteria();
		criteria.andCommentIdIn(list);
		sheet_commentsMapper.deleteByExample(example);
	}
}
