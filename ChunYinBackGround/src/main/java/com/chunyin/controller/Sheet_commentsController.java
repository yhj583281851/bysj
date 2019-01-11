package com.chunyin.controller;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.chunyin.bean.Msg;
import com.chunyin.bean.Sheet_comments;
import com.chunyin.service.Sheet_commentsService;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;

/**
 * 歌单评论controller
 * @author Administrator
 *
 */
@Controller
public class Sheet_commentsController {

	@Autowired
	Sheet_commentsService sheet_commentsService;
	
	/**
	 * 增添新评论
	 */
	@ResponseBody
	@RequestMapping("insertSheetComments")
	public Msg insertSheetComments(Sheet_comments sheet_comments){
		int flag = sheet_commentsService.insertSheetComments(sheet_comments);
		if (flag != 0) {
			return Msg.success();
		}
		return Msg.error();
	}
	
	/**
	 * 增添回复评论
	 */
	@ResponseBody
	@RequestMapping("insertSheetCommentsAnswer")
	public Msg insertSheetCommentsAnswer(Sheet_comments sheet_comments){
		Sheet_comments sheet_comment = sheet_commentsService.insertSheetCommentsAnswer(sheet_comments);
		if (sheet_comment != null) {
			return Msg.success().add("sheet_comment", sheet_comment);//返回被回复的评论
		}
		return Msg.error();
	}
	
	
	/**
	 * 通过歌单id查询歌单评论
	 */
	@ResponseBody
	@RequestMapping("selectSheetCommentsBySheetId")
	public Msg selectSheetCommentsBySheetId(@RequestParam(value="pn",defaultValue="1")Integer pn,int sheetId){
		PageHelper.startPage(pn, 10);
		
		List<Sheet_comments> list = sheet_commentsService.selectSheetCommentsBySheetId(sheetId);
		
		PageInfo<Sheet_comments> pageInfo = new PageInfo<Sheet_comments>(list);
		if (list.size() != 0) {
			return Msg.success().add("pageInfo", pageInfo);
		}
		return Msg.error();
	}
	
	/**
	 * 通过用户id查询歌单评论
	 */
	@ResponseBody
	@RequestMapping("selectSheetCommentsByUserId")
	public Msg selectSheetCommentsByUserId(@RequestParam(value="pn",defaultValue="1")Integer pn,int userId){
		PageHelper.startPage(pn, 10);
		
		List<Sheet_comments> list = sheet_commentsService.selectSheetCommentsByUserId(userId);
		
		PageInfo<Sheet_comments> pageInfo = new PageInfo<Sheet_comments>(list);
		if (list.size() != 0) {
			return Msg.success().add("pageInfo", pageInfo);
		}
		return Msg.error();
	}
	
	/**
	 * 通过评论id查询歌单评论
	 */
	@ResponseBody
	@RequestMapping("selectSheetCommentsByCommentId")
	public Msg selectSheetCommentsByCommentId(int commentId){
		Sheet_comments sheet_comments = sheet_commentsService.selectSheetCommentsByCommentId(commentId);
		if(sheet_comments!=null){
			return Msg.success();
		}
		return Msg.error();
	}
	
	/**
	 * 删除评论
	 */
	@ResponseBody
	@RequestMapping("deleteSheetCommentsByCommentId")
	public Msg deleteSongCommentsByCommentId(int commentId){
		int flag = sheet_commentsService.deleteSheetCommentsByCommentId(commentId);
		if(flag!=0){
			return Msg.success();
		}
		return Msg.error();
	}
	
	/**
	 * 根据checkbox和id删除选中评论
	 */
	@ResponseBody
	@RequestMapping("deleteSheetCommentsByCheckBox")
	public Msg deleteSheetCommentsByCheckBox(String ids) {
		if (ids.contains("-")) {
			List<Integer> list = new ArrayList<Integer>();
			String[] str_ids = ids.split("-");
			for (String id : str_ids) {
				list.add(Integer.parseInt(id));
			}
			sheet_commentsService.deleteSheetCommentsByCheckBox(list);
		} else {
			sheet_commentsService.deleteSheetCommentsByCommentId(Integer.parseInt(ids));
		}
		return Msg.success();
	}
}
