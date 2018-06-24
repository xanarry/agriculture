package com.agriculture.dataBase.dao;

import com.agriculture.dataBase.domain.CheckReport;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface CheckReportDao {
    void addCheckReport(@Param("checkReport") CheckReport checkReport);
    void deleteCheckReport(int ID);
    void updateCheckReport(@Param("checkReport") CheckReport checkReport);
    CheckReport getCheckReport(int ID);
    List<CheckReport> getCheckReportList(@Param("start") Integer start, @Param("count") Integer count, @Param("taskID") String taskID);
    int getCount();
}
