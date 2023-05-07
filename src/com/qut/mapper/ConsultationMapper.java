package com.qut.mapper;

import com.qut.pojo.Consultation;
import org.springframework.stereotype.Repository;

@Repository("consultationMapper")
public interface ConsultationMapper {
    /**
     * 会诊数据录入
     *
     * @param consultation
     */
    void consultationSave(Consultation consultation);
}
