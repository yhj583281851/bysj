package com.chunyin.dao;

import com.chunyin.bean.Composer;
import com.chunyin.bean.ComposerExample;
import java.util.List;
import org.apache.ibatis.annotations.Param;

public interface ComposerMapper {
    int countByExample(ComposerExample example);

    int deleteByExample(ComposerExample example);

    int deleteByPrimaryKey(Integer composerId);

    int insert(Composer record);

    int insertSelective(Composer record);

    List<Composer> selectByExampleWithBLOBs(ComposerExample example);

    List<Composer> selectByExample(ComposerExample example);

    Composer selectByPrimaryKey(Integer composerId);

    int updateByExampleSelective(@Param("record") Composer record, @Param("example") ComposerExample example);

    int updateByExampleWithBLOBs(@Param("record") Composer record, @Param("example") ComposerExample example);

    int updateByExample(@Param("record") Composer record, @Param("example") ComposerExample example);

    int updateByPrimaryKeySelective(Composer record);

    int updateByPrimaryKeyWithBLOBs(Composer record);

    int updateByPrimaryKey(Composer record);
}