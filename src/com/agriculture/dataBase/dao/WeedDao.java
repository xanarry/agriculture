package com.agriculture.dataBase.dao;

import com.agriculture.dataBase.domain.Weed;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface WeedDao {
    void addWeed(@Param("weed") Weed weed);
    void deleteWeed(int ID);
    void updateWeed(@Param("weed") Weed weed);
    Weed getWeed(int ID);
    List<Weed> getWeedList(@Param("start") Integer start, @Param("count") Integer count, @Param("taskID") String taskID);
    int getCount();
}
