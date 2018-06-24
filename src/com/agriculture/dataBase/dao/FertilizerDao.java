package com.agriculture.dataBase.dao;

import com.agriculture.dataBase.domain.Fertilizer;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface FertilizerDao {
    void addFertilizer(@Param("fertilizer") Fertilizer fertilizer);
    void deleteFertilizer(int ID);
    void updateFertilizer(@Param("fertilizer") Fertilizer fertilizer);
    Fertilizer getFertilizer(int ID);
    List<Fertilizer> getFertilizerList(@Param("start") Integer start, @Param("count") Integer count);
    int getCount();
}
