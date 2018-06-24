package com.agriculture.dataBase.dao;

import com.agriculture.dataBase.domain.Seed;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface SeedDao {
    void addSeed(@Param("seed") Seed seed);
    void deleteSeed(int ID);
    void updateSeed(@Param("seed") Seed seed);
    Seed getSeed(int ID);
    List<Seed> getSeedList(@Param("start") Integer start, @Param("count") Integer count);
    int getCount();
}
