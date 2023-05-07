package com.qut.mapper;

import com.qut.pojo.MedicalRecord;
import com.qut.pojo.PatientCode;
import org.springframework.stereotype.Repository;

import java.util.List;
import java.util.Map;

@Repository("medicalRecordMapper")
public interface MedicalRecordMapper {
    /**
     * 电子病历数据录入
     *
     * @param medicalRecord
     */
    void medicalRecordSave(MedicalRecord medicalRecord);

    /**
     * 电子病历查询
     *
     * @param patientCode
     */
    List<Map<String,Object>> medicalRecordQuery(PatientCode patientCode);
}
