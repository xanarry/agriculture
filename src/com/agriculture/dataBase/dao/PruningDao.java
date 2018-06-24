package com.agriculture.dataBase.dao;

import com.agriculture.dataBase.domain.Pruning;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface PruningDao {
    void addPruning(@Param("pruning") Pruning pruning);
    void deletePruning(int ID);
    void updatePruning(@Param("pruning") Pruning pruning);
    Pruning getPruning(int ID);
    List<Pruning> getPruningList(@Param("start") Integer start, @Param("count") Integer count, @Param("taskID") String taskID);
    int getCount();
}
