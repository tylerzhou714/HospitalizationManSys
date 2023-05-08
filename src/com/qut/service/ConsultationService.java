package com.qut.service;

import com.qut.pojo.Consultation;

import java.util.List;
import java.util.Map;

public interface ConsultationService {
    /**
     * 会诊数据录入
     */
    void consultationSave(Consultation consultation);

    /**
     * 根据身份证查询用户会诊数据
     */
    List<Map<String, Object>> consultationQueryByCertificateNo(String certificateNo);
}
