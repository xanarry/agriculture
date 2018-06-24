package com.agriculture.dataBase.dao;

import com.agriculture.dataBase.domain.ProduceTask;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface ProduceTaskDao {
    void addProduceTask(@Param("produceTask") ProduceTask produceTask);
    void deleteProduceTask(String ID);
    void updateProduceTask(@Param("produceTask") ProduceTask produceTask);
    ProduceTask getProduceTask(String ID);
    List<ProduceTask> getProduceTaskList(@Param("start") Integer start, @Param("count") Integer count);
    int getCount();
}
