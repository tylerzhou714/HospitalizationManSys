package com.qut.mapper;

import com.qut.pojo.LabOrder;
import org.springframework.stereotype.Repository;

@Repository("labOrderMapper")
public interface LabOrderMapper {
    /**
     * 检验单数据录入
     *
     * @param labOrder
     */
    void labOrderSave(LabOrder labOrder);
}
