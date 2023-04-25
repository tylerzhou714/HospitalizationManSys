package com.qut.mapper;

import com.qut.pojo.Appointment;
import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import java.util.List;

/**
 * 挂号管理
 */
@Repository("appointmentMapper")
public interface AppointmentMapper {
    /**
     * 挂号查询
     */
    Appointment findAppointment(Appointment appointment);

    /**
     * 挂号
     */
    Appointment saveAppointment(Appointment appointment);

    /**
     * 用id查询挂号
     */

    Appointment findAppointmentById(@Param("id") String id);

    /**
     * 批量查询挂号
     */
    List<Appointment> appointmentQuery(Appointment appointment);

    /**
     * 更新挂号（退号）
     */
    void updateAppointment(String id);

}
