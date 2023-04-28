package com.qut.service;

import com.qut.pojo.Schedule;

public interface ScheduleService {
    /**
     * 保存排班信息
     */
    void scheduleSave(Schedule schedule);
}
