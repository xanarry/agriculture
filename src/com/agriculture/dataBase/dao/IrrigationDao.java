package com.agriculture.dataBase.dao;

import com.agriculture.dataBase.domain.Irrigation;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface IrrigationDao {
    void addIrrigation(@Param("irrigation") Irrigation irrigation);
    void deleteIrrigation(int ID);
    void updateIrrigation(@Param("irrigation") Irrigation irrigation);
    Irrigation getIrrigation(int ID);
    List<Irrigation> getIrrigationList(@Param("start") Integer start, @Param("count") Integer count, @Param("taskID") String taskID);
    int getCount();
}
