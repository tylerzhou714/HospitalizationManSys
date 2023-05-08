package com.qut.service;

import com.qut.pojo.LabOrder;

import java.util.List;
import java.util.Map;

public interface LabOrderService {
    /**
     * 检验单数据录入
     */
    void labOrferSave(LabOrder labOrder);

    /**
     * 根据用户身份证查询检验单数据
     */
    List<Map<String, Object>> labOrderQueryByCertificateNo(String certificateNo);

}
