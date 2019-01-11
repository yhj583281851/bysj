package com.chunyin.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.chunyin.bean.ComposerExample;
import com.chunyin.bean.Song_comments;
import com.chunyin.bean.Song_commentsExample;
import com.chunyin.bean.Song_commentsExample.Criteria;
import com.chunyin.dao.Song_commentsMapper;

@Service
public class Song_commentsService {

	@Autowired
	Song_commentsMapper song_commentsMapper;

	/**
	 * 增添评论
	 */
	public int insertSongComments(Song_comments song_commnets) {
		return song_commentsMapper.insert(song_commnets);
	}
	
	/**
	 * 增添回复评论
	 */
	public Song_comments insertSongCommentsAnswer(Song_comments song_commnets) {
		song_commentsMapper.insert(song_commnets);
		Song_commentsExample example = new Song_commentsExample();
		Criteria criteria = example.createCriteria();
		criteria.andToUidEqualTo(song_commnets.getToUid());
		return song_commentsMapper.selectByExampleWithBLOBs(example).get(0);
	}
	
	/**
	 * 通过歌曲id查询评论
	 */
	public List<Song_comments> selectSongCommentsBySongId(int songId) {
		Song_commentsExample example = new Song_commentsExample();
		Criteria criteria = example.createCriteria();
		criteria.andSongIdEqualTo(songId);
		example.setOrderByClause("comment_id desc");
		return song_commentsMapper.selectByExampleWithBLOBs(example);
	}

	/**
	 * 通过用户id查询评论
	 */
	public List<Song_comments> selectSongCommentsByUserId(int userId) {
		Song_commentsExample example = new Song_commentsExample();
		Criteria criteria = example.createCriteria();
		criteria.andUserIdEqualTo(userId);
		example.setOrderByClause("comment_id desc");
		return song_commentsMapper.selectByExampleWithBLOBs(example);
	}

	/**
	 * 通过评论id查询歌曲评论
	 */
	public Song_comments selectSongCommentsByCommentId(int commentId) {
		Song_commentsExample example = new Song_commentsExample();
		Criteria criteria = example.createCriteria();
		criteria.andCommentIdEqualTo(commentId);
		return song_commentsMapper.selectByExampleWithBLOBs(example).get(0);
	}

	/**
	 * 删除评论
	 */
	public int deleteSongCommentsByCommentId(int commentId) {
		Song_commentsExample example = new Song_commentsExample();
		Criteria criteria = example.createCriteria();
		criteria.andCommentIdEqualTo(commentId);
		return song_commentsMapper.deleteByExample(example);
	}

	/**
	 * 根据checkbox和id删除选中评论
	 */
	public void deleteSongCommentsByCheckBox(List<Integer> list) {
		Song_commentsExample example = new Song_commentsExample();
		Criteria criteria = example.createCriteria();
		criteria.andCommentIdIn(list);
		song_commentsMapper.deleteByExample(example);
	}

}
