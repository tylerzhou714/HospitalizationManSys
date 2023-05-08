package com.qut.mapper;

import com.qut.pojo.Consultation;
import org.springframework.stereotype.Repository;

import java.util.List;
import java.util.Map;

@Repository("consultationMapper")
public interface ConsultationMapper {
    /**
     * 会诊数据录入
     *
     * @param consultation
     */
    void consultationSave(Consultation consultation);

    /**
     * 根据id查询会诊信息
     *
     * @param certificateNo
     */
    List<Map<String, Object>> consultationQueryByCertificateNo(String certificateNo);
}
