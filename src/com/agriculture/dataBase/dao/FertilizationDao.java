package com.agriculture.dataBase.dao;

import com.agriculture.dataBase.domain.Fertilization;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface FertilizationDao {
    void addFertilization(@Param("fertilization") Fertilization fertilization);
    void deleteFertilization(int ID);
    void updateFertilization(@Param("fertilization") Fertilization fertilization);
    Fertilization getFertilization(int ID);
    List<Fertilization> getFertilizationList(@Param("start") Integer start, @Param("count") Integer count);
    int getCount();
}
