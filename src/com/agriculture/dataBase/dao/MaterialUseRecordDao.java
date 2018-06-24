package com.agriculture.dataBase.dao;

import com.agriculture.dataBase.domain.MaterialUseRecord;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface MaterialUseRecordDao {
    void addMaterialUseRecord(@Param("materialUseRecord") MaterialUseRecord materialUseRecord);
    void deleteMaterialUseRecord(int ID);
    void updateMaterialUseRecord(@Param("materialUseRecord") MaterialUseRecord materialUseRecord);
    MaterialUseRecord getMaterialUseRecord(int ID);
    List<MaterialUseRecord> getMaterialUseRecordList(@Param("start") Integer start, @Param("count") Integer count);
    int getCount();
}
