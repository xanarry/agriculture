package com.agriculture.dataBase.dao;

import com.agriculture.dataBase.domain.ProductPack;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface ProductPackDao {
    void addProductPack(@Param("productPack") ProductPack productPack);
    void deleteProductPack(int ID);
    void updateProductPack(@Param("productPack") ProductPack productPack);
    ProductPack getProductPack(int ID);
    List<ProductPack> getProductPackList(@Param("start") Integer start, @Param("count") Integer count, @Param("taskID") String taskID);
    int getCount();
}
