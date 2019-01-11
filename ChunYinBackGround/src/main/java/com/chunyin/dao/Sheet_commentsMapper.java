package com.chunyin.dao;

import com.chunyin.bean.Sheet_comments;
import com.chunyin.bean.Sheet_commentsExample;
import com.chunyin.bean.Sheet_commentsKey;
import java.util.List;
import org.apache.ibatis.annotations.Param;

public interface Sheet_commentsMapper {
    int countByExample(Sheet_commentsExample example);

    int deleteByExample(Sheet_commentsExample example);

    int deleteByPrimaryKey(Sheet_commentsKey key);

    int insert(Sheet_comments record);

    int insertSelective(Sheet_comments record);

    List<Sheet_comments> selectByExampleWithBLOBs(Sheet_commentsExample example);

    List<Sheet_comments> selectByExample(Sheet_commentsExample example);

    Sheet_comments selectByPrimaryKey(Sheet_commentsKey key);

    int updateByExampleSelective(@Param("record") Sheet_comments record, @Param("example") Sheet_commentsExample example);

    int updateByExampleWithBLOBs(@Param("record") Sheet_comments record, @Param("example") Sheet_commentsExample example);

    int updateByExample(@Param("record") Sheet_comments record, @Param("example") Sheet_commentsExample example);

    int updateByPrimaryKeySelective(Sheet_comments record);

    int updateByPrimaryKeyWithBLOBs(Sheet_comments record);

    int updateByPrimaryKey(Sheet_comments record);
}