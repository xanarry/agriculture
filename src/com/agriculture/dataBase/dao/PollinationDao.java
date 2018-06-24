package com.agriculture.dataBase.dao;

import com.agriculture.dataBase.domain.Pollination;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface PollinationDao {
    void addPollination(@Param("pollination") Pollination pollination);
    void deletePollination(int ID);
    void updatePollination(@Param("pollination") Pollination pollination);
    Pollination getPollination(int ID);
    List<Pollination> getPollinationList(@Param("start") Integer start, @Param("count") Integer count, @Param("taskID") String taskID);
    int getCount();
}
