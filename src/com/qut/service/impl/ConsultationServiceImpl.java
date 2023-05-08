package com.qut.service.impl;

import com.qut.mapper.ConsultationMapper;
import com.qut.mapper.MedicalRecordMapper;
import com.qut.pojo.Consultation;
import com.qut.pojo.MedicalRecord;
import com.qut.service.ConsultationService;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Isolation;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import javax.annotation.Resource;
import java.util.List;
import java.util.Map;

@Service("consultationService")
@Transactional(propagation = Propagation.NOT_SUPPORTED, readOnly = true)
public class ConsultationServiceImpl implements ConsultationService {
    @Resource(name = "consultationMapper")
    private ConsultationMapper consultationMapper;

    @Override
    @Transactional(propagation = Propagation.REQUIRED, isolation = Isolation.DEFAULT, rollbackFor = Exception.class)
    public void consultationSave(Consultation consultation) {
        consultationMapper.consultationSave(consultation);
    }

    @Override
    public List<Map<String, Object>> consultationQueryByCertificateNo(String certificateNo) {
        return consultationMapper.consultationQueryByCertificateNo(certificateNo);
    }
}
