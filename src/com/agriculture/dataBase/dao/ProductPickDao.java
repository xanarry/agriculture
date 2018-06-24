package com.agriculture.dataBase.dao;

import com.agriculture.dataBase.domain.ProductPick;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface ProductPickDao {
    void addProductPick(@Param("productPick") ProductPick productPick);
    void deleteProductPick(int ID);
    void updateProductPick(@Param("productPick") ProductPick productPick);
    ProductPick getProductPick(int ID);
    List<ProductPick> getProductPickList(@Param("start") Integer start, @Param("count") Integer count, @Param("taskID") String taskID);
    int getCount();
}
