package com.agriculture.dataBase.dao;

import com.agriculture.dataBase.domain.Sow;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface SowDao {
    void addSow(@Param("sow") Sow sow);
    void deleteSow(int ID);
    void updateSow(@Param("sow") Sow sow);
    Sow getSow(int ID);
    List<Sow> getSowList(@Param("start") Integer start, @Param("count") Integer count, @Param("taskID") String taskID);
    int getCount();
}
