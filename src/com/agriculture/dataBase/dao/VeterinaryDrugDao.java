package com.agriculture.dataBase.dao;

import com.agriculture.dataBase.domain.VeterinaryDrug;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface VeterinaryDrugDao {
    void addVeterinaryDrug(@Param("veterinaryDrug") VeterinaryDrug veterinaryDrug);
    void deleteVeterinaryDrug(Integer ID);
    void updateVeterinaryDrug(@Param("veterinaryDrug") VeterinaryDrug veterinaryDrug);
    VeterinaryDrug getVeterinaryDrug(Integer ID);
    List<VeterinaryDrug> getVeterinaryDrugList(@Param("start") Integer start, @Param("count") Integer count);
    int getCount();
}
