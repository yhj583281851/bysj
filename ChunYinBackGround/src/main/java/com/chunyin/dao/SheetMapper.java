package com.chunyin.dao;

import com.chunyin.bean.Sheet;
import com.chunyin.bean.SheetExample;
import com.chunyin.bean.SheetKey;
import java.util.List;
import org.apache.ibatis.annotations.Param;

public interface SheetMapper {
    int countByExample(SheetExample example);

    int deleteByExample(SheetExample example);

    int deleteByPrimaryKey(SheetKey key);

    int insert(Sheet record);

    int insertSelective(Sheet record);

    List<Sheet> selectByExampleWithBLOBs(SheetExample example);

    List<Sheet> selectByExample(SheetExample example);

    Sheet selectByPrimaryKey(SheetKey key);

    int updateByExampleSelective(@Param("record") Sheet record, @Param("example") SheetExample example);

    int updateByExampleWithBLOBs(@Param("record") Sheet record, @Param("example") SheetExample example);

    int updateByExample(@Param("record") Sheet record, @Param("example") SheetExample example);

    int updateByPrimaryKeySelective(Sheet record);

    int updateByPrimaryKeyWithBLOBs(Sheet record);

    int updateByPrimaryKey(Sheet record);
}