package com.agriculture.dataBase.dao;

import com.agriculture.dataBase.domain.PurchaseRecord;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface PurchaseRecordDao {
    void addPurchaseRecord(@Param("purchaseRecord") PurchaseRecord purchaseRecord);
    void deletePurchaseRecord(int ID);
    void updatePurchaseRecord(@Param("purchaseRecord") PurchaseRecord purchaseRecord);
    PurchaseRecord getPurchaseRecord(int ID);
    List<PurchaseRecord> getPurchaseRecordList(@Param("start") Integer start, @Param("count") Integer count);
    int getCount();
}
