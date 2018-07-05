
package com.agriculture.dataBase.dao;
import com.agriculture.dataBase.domain.Plough;
import org.apache.ibatis.annotations.Param;
import java.util.List;
public interface PloughDao {
    void addPlough(@Param("plough") Plough plough);
    void deletePlough(int ID);
    void updatePlough(@Param("plough") Plough plough);
    Plough getPlough(int ID);
    List<Plough> getPloughList(@Param("start") Integer start, @Param("count") Integer count, @Param("taskID") String taskID);
    int getCount();
}