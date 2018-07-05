package com.agriculture.dataBase.dao;

import com.agriculture.dataBase.domain.ProductIdentity;
import org.apache.ibatis.annotations.Param;
import java.util.List;
public interface ProductIdentityDao {
    void addProductIdentity(@Param("productIdentity") ProductIdentity productIdentity);
    void deleteProductIdentity(@Param("produceTaskID") String produceTaskID, @Param("productIdentity") String productIdentity);
    void updateProductIdentity(@Param("productIdentity") ProductIdentity productIdentity);
    ProductIdentity getProductIdentity(@Param("produceTaskID") String produceTaskID, @Param("productIdentity") String productIdentity);
    List<ProductIdentity> getProductIdentityList(@Param("start") Integer start, @Param("count") Integer count);
    int getCount();
}
