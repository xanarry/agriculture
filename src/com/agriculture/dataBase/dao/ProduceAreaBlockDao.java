package com.agriculture.dataBase.dao;

import com.agriculture.dataBase.domain.ProduceAreaBlock;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface ProduceAreaBlockDao {
    void addProduceAreaBlock(@Param("produceAreaBlock") ProduceAreaBlock produceAreaBlock);
    void deleteProduceAreaBlock(int ID);
    void updateProduceAreaBlock(@Param("produceAreaBlock") ProduceAreaBlock produceAreaBlock);
    ProduceAreaBlock getProduceAreaBlock(int ID);
    List<ProduceAreaBlock> getProduceAreaBlockList(@Param("start") Integer start, @Param("count") Integer count, @Param("taskID") String taskID);
    int getCount();
}
