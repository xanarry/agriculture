package com.agriculture.dataBase.dao;

import com.agriculture.dataBase.domain.User;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface UserDao {
    void addUser(@Param("user") User user);
    void deleteUser(String ID);
    void updateUser(@Param("user") User user);
    User getUser(String ID);
    User getUserByLoginName(String loginName);
    List<User> getUserList(@Param("start") Integer start, @Param("count") Integer count);
    int getCount();
}
