package com.agriculture.dataBase.dao;

import com.agriculture.dataBase.domain.SellInfo;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface SellInfoDao {
    void addSellInfo(@Param("sellInfo") SellInfo sellInfo);
    void deleteSellInfo(int ID);
    void updateSellInfo(@Param("sellInfo") SellInfo sellInfo);
    SellInfo getSellInfo(int ID);
    List<SellInfo> getSellInfoList(@Param("start") Integer start, @Param("count") Integer count, @Param("taskID") String taskID);
    int getCount();
}
