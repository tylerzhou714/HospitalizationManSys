package com.qut.service.impl;

import com.qut.mapper.LabOrderMapper;
import com.qut.pojo.LabOrder;
import com.qut.service.LabOrderService;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Isolation;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import javax.annotation.Resource;

@Service("labOrderService")
@Transactional(propagation = Propagation.NOT_SUPPORTED, readOnly = true)
public class LabOrderServiceImpl implements LabOrderService {
    @Resource(name = "labOrderMapper")
    private LabOrderMapper labOrderMapper;

    @Override
    @Transactional(propagation = Propagation.REQUIRED, isolation = Isolation.DEFAULT, rollbackFor = Exception.class)
    public void labOrferSave(LabOrder labOrder) {
        labOrderMapper.labOrderSave(labOrder);
    }
}
