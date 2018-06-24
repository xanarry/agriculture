package com.agriculture.dataBase.dao;

import com.agriculture.dataBase.domain.Pesticide;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface PesticideDao {
    void addPesticide(@Param("pesticide") Pesticide pesticide);
    void deletePesticide(int ID);
    void updatePesticide(@Param("pesticide") Pesticide pesticide);
    Pesticide getPesticide(int ID);
    List<Pesticide> getPesticideList(@Param("start") Integer start, @Param("count") Integer count);
    int getCount();
}
