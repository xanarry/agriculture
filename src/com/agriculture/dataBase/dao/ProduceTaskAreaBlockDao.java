package com.agriculture.dataBase.dao;

import com.agriculture.dataBase.domain.ProduceTaskAreaBlock;
import org.apache.ibatis.annotations.Param;
import java.util.List;
public interface ProduceTaskAreaBlockDao {
    void addProduceTaskAreaBlock(@Param("produceTaskAreaBlock") ProduceTaskAreaBlock produceTaskAreaBlock);
    void deleteProduceTaskAreaBlock(@Param("taskID") String taskID, @Param("areaBlockID") Integer areaBlockID);
    void updateProduceTaskAreaBlock(@Param("produceTaskAreaBlock") ProduceTaskAreaBlock produceTaskAreaBlock);
    ProduceTaskAreaBlock getProduceTaskAreaBlock(@Param("taskID") String taskID, @Param("areaBlockID") Integer areaBlockID);
    List<ProduceTaskAreaBlock> getProduceTaskAreaBlockList(@Param("start") Integer start,
                                                           @Param("count") Integer count,
                                                           @Param("taskID") String taskID);
    int getCount();
}
