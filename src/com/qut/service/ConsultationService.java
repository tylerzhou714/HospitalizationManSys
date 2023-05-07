package com.qut.service;

import com.qut.pojo.Consultation;

public interface ConsultationService {
    /**
     * 会诊数据录入
     */
    void consultationSave(Consultation consultation);
}
