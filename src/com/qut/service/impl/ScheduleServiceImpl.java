package com.qut.service.impl;

import com.qut.mapper.ScheduleMapper;
import com.qut.pojo.Schedule;
import com.qut.service.ScheduleService;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Isolation;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import javax.annotation.Resource;

@Service("scheduleService")
@Transactional(propagation = Propagation.NOT_SUPPORTED,readOnly = true)
public class ScheduleServiceImpl implements ScheduleService {
    @Resource(name = "scheduleMapper")
    private ScheduleMapper scheduleMapper;

    @Override
    @Transactional(propagation = Propagation.REQUIRED, isolation = Isolation.DEFAULT, rollbackFor = Exception.class)
    public void scheduleSave(Schedule schedule){
        scheduleMapper.saveSchedule(schedule);
    }
}
