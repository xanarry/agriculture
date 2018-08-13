package com.agriculture.dataBase.dao;

import com.agriculture.dataBase.domain.AreaBlock;
import org.apache.ibatis.annotations.MapKey;
import org.apache.ibatis.annotations.Param;
import java.util.List;
import java.util.Map;

public interface AreaBlockDao {
    void addAreaBlock(@Param("areaBlock") AreaBlock areaBlock);
    void deleteAreaBlock(@Param("ID") Integer ID);
    void updateAreaBlock(@Param("areaBlock") AreaBlock areaBlock);
    AreaBlock getAreaBlock(@Param("ID") Integer ID);
    List<AreaBlock> getAreaBlockList(@Param("start") Integer start, @Param("count") Integer count);
    @MapKey("ID")
    Map<Integer, AreaBlock> getAreaBlockMap();
    int getCount();
}
