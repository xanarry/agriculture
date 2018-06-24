package com.agriculture.dataBase.dao;

import com.agriculture.dataBase.domain.Unit;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface UnitDao {
    void addUnit(@Param("unit") Unit unit);
    void deleteUnit(Integer ID);
    void updateUnit(@Param("unit") Unit unit);
    Unit getUnit(Integer ID);
    List<Unit> getUnitList(@Param("start") Integer start, @Param("count") Integer count);
    int getCount();
}
