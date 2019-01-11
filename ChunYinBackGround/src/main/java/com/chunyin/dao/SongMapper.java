package com.chunyin.dao;

import com.chunyin.bean.Song;
import com.chunyin.bean.SongExample;
import java.util.List;
import org.apache.ibatis.annotations.Param;

public interface SongMapper {
    int countByExample(SongExample example);

    int deleteByExample(SongExample example);

    int deleteByPrimaryKey(Integer songId);

    int insert(Song record);

    int insertSelective(Song record);

    List<Song> selectByExample(SongExample example);

    Song selectByPrimaryKey(Integer songId);

    int updateByExampleSelective(@Param("record") Song record, @Param("example") SongExample example);

    int updateByExample(@Param("record") Song record, @Param("example") SongExample example);

    int updateByPrimaryKeySelective(Song record);

    int updateByPrimaryKey(Song record);
}