package com.qut.service.impl;

import com.qut.pojo.MedicalRecord;
import com.qut.pojo.PatientCode;
import com.qut.service.MedicalRecordService;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Isolation;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import javax.annotation.Resource;
import java.util.List;
import java.util.Map;

@Service("medicalRecordService")
@Transactional(propagation = Propagation.NOT_SUPPORTED, readOnly = true)
public class medicalRecordServiceImpl implements MedicalRecordService {
    @Resource(name = "medicalRecordMapper")
    private MedicalRecord medicalRecord;

    @Override
    @Transactional(propagation = Propagation.REQUIRED, isolation = Isolation.DEFAULT, rollbackFor = Exception.class)
    public void medicalRecordSave(MedicalRecord medicalRecord) {

    }

    @Override
    public List<Map<String, Object>> medicalRecordQuery(PatientCode patientCode) {
        return null;
    }
}
