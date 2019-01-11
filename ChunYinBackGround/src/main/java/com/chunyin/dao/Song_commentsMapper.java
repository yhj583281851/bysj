package com.chunyin.dao;

import com.chunyin.bean.Song_comments;
import com.chunyin.bean.Song_commentsExample;
import com.chunyin.bean.Song_commentsKey;
import java.util.List;
import org.apache.ibatis.annotations.Param;

public interface Song_commentsMapper {
    int countByExample(Song_commentsExample example);

    int deleteByExample(Song_commentsExample example);

    int deleteByPrimaryKey(Song_commentsKey key);

    int insert(Song_comments record);

    int insertSelective(Song_comments record);

    List<Song_comments> selectByExampleWithBLOBs(Song_commentsExample example);

    List<Song_comments> selectByExample(Song_commentsExample example);

    Song_comments selectByPrimaryKey(Song_commentsKey key);

    int updateByExampleSelective(@Param("record") Song_comments record, @Param("example") Song_commentsExample example);

    int updateByExampleWithBLOBs(@Param("record") Song_comments record, @Param("example") Song_commentsExample example);

    int updateByExample(@Param("record") Song_comments record, @Param("example") Song_commentsExample example);

    int updateByPrimaryKeySelective(Song_comments record);

    int updateByPrimaryKeyWithBLOBs(Song_comments record);

    int updateByPrimaryKey(Song_comments record);
}