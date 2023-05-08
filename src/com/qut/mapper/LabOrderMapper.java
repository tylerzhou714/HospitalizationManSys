package com.qut.mapper;

import com.qut.pojo.LabOrder;
import org.springframework.stereotype.Repository;

import java.util.List;
import java.util.Map;

@Repository("labOrderMapper")
public interface LabOrderMapper {
    /**
     * 检验单数据录入
     *
     * @param labOrder
     */
    void labOrderSave(LabOrder labOrder);

    /**
     * 检验单数据查询
     *
     */
    List<Map<String, Object>> labOrderQueryByCertificateNo(String certificateNo);
}
