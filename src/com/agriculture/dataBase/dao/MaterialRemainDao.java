package com.agriculture.dataBase.dao;

import com.agriculture.dataBase.domain.MaterialRemain;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface MaterialRemainDao {
    void addMaterialRemain(@Param("materialRemain") MaterialRemain materialRemain);
    void deleteMaterialRemain(String materialID);
    void updateMaterialRemain(@Param("materialRemain") MaterialRemain materialRemain);
    MaterialRemain getMaterialRemain(String materialID);
    List<MaterialRemain> getMaterialRemainList(@Param("start") Integer start, @Param("count") Integer count);
    int getCount();
}
