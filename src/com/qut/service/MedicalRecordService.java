package com.qut.service;

import com.qut.pojo.MedicalRecord;
import com.qut.pojo.PatientCode;

import java.util.List;
import java.util.Map;

public interface MedicalRecordService {
    /**
     * 病历数据录入
     */
    void medicalRecordSave(MedicalRecord medicalRecord);

    /**
     * 病历数据查询
     */
    List<Map<String, Object>> medicalRecordQuery(PatientCode patientCode);

    /**
     * 根据病人id查询病历
     */
    List<Map<String, Object>> medicalRecordQueryByPatientId(String certificateNo);

}
