package com.agriculture.dataBase.dao;

import com.agriculture.dataBase.domain.ShuguoRecord;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface ShuguoRecordDao {
    void addShuguoRecord(@Param("shuguoRecord") ShuguoRecord shuguoRecord);
    void deleteShuguoRecord(int ID);
    void updateShuguoRecord(@Param("shuguoRecord") ShuguoRecord shuguoRecord);
    ShuguoRecord getShuguoRecord(int ID);
    List<ShuguoRecord> getShuguoRecordList(@Param("start") Integer start, @Param("count") Integer count, @Param("taskID") String taskID);
    int getCount();
}
