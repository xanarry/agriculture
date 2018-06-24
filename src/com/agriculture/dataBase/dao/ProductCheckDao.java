package com.agriculture.dataBase.dao;

import com.agriculture.dataBase.domain.ProductCheck;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface ProductCheckDao {
    void addProductCheck(@Param("productCheck") ProductCheck productCheck);
    void deleteProductCheck(int ID);
    void updateProductCheck(@Param("productCheck") ProductCheck productCheck);
    ProductCheck getProductCheck(int ID);
    List<ProductCheck> getProductCheckList(@Param("start") Integer start, @Param("count") Integer count, @Param("taskID") String taskID);
    int getCount();
}
