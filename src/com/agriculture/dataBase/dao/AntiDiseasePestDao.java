package com.agriculture.dataBase.dao;

import com.agriculture.dataBase.domain.AntiDiseasePest;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface AntiDiseasePestDao {
    void addAntiDiseasePest(@Param("antiDiseasePest") AntiDiseasePest antiDiseasePest);
    void deleteAntiDiseasePest(int ID);
    void updateAntiDiseasePest(@Param("antiDiseasePest") AntiDiseasePest antiDiseasePest);
    AntiDiseasePest getAntiDiseasePest(int ID);
    List<AntiDiseasePest> getAntiDiseasePestList(@Param("start") Integer start, @Param("count") Integer count, @Param("taskID") String taskID);
    int getCount();
}
