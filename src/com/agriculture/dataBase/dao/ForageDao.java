package com.agriculture.dataBase.dao;

import com.agriculture.dataBase.domain.Forage;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface ForageDao {
    void addForage(@Param("forage") Forage forage);
    void deleteForage(Integer ID);
    void updateForage(@Param("forage") Forage forage);
    Forage getForage(Integer ID);
    List<Forage> getForageList(@Param("start") Integer start, @Param("count") Integer count);
    int getCount();
}
