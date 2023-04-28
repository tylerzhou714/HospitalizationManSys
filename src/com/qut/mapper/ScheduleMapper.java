package com.qut.mapper;

import com.qut.pojo.Schedule;
import org.springframework.stereotype.Repository;

import java.util.List;

/**
 * 排班dao
 */
@Repository("scheduleMapper")
public interface ScheduleMapper {
    /**
     * 添加排班信息
     */
    void saveSchedule(Schedule schedule);

    /**
     * 查询排班信息
     */
    List<Schedule> scheduleQuery(Integer doctorId);

    /**
     * 修改排班
     */
    void updateSchedule(Schedule schedule);
}

