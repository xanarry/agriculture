package com.agriculture.dataBase.dao;

import com.agriculture.dataBase.domain.ProductIdentifier;
import org.apache.ibatis.annotations.Param;
import java.util.List;
public interface ProductIdentifierDao {
    void addProductIdentifier(@Param("productIdentifier") ProductIdentifier productIdentifier);
    void deleteProductIdentifier(@Param("produceTaskID") String produceTaskID, @Param("identifier") String identifier);
    void updateProductIdentifier(@Param("productIdentifier") ProductIdentifier productIdentifier);
    ProductIdentifier getProductIdentifier(@Param("produceTaskID") String produceTaskID, @Param("identifier") String identifier);
    List<ProductIdentifier> getProductIdentifierList(@Param("start") Integer start, @Param("count") Integer count, @Param("produceTaskID") String produceTaskID);
    int getCount();
}
