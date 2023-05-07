package com.qut.pojo;

import java.io.Serializable;
import java.util.Date;

/**
 * 会诊封装表
 *
 */
public class Consultation implements Serializable {
    private static final long serialVersionUID = 1L;
    private Integer id;
    private String patientId;
    private String patientName;
    private String bedNo;
    private String consultingDoctor;
    private String diagnosis;
    private Date createTime;
    private Date updateTime;

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getPatientId() {
        return patientId;
    }

    public void setPatientId(String patientId) {
        this.patientId = patientId;
    }

    public String getPatientName() {
        return patientName;
    }

    public void setPatientName(String patientName) {
        this.patientName = patientName;
    }

    public String getBedNo() {
        return bedNo;
    }

    public void setBedNo(String bedNo) {
        this.bedNo = bedNo;
    }

    public String getConsultingDoctor() {
        return consultingDoctor;
    }

    public void setConsultingDoctor(String consultingDoctor) {
        this.consultingDoctor = consultingDoctor;
    }

    public String getDiagnosis() {
        return diagnosis;
    }

    public void setDiagnosis(String diagnosis) {
        this.diagnosis = diagnosis;
    }

    public Date getCreateTime() {
        return createTime;
    }

    public void setCreateTime(Date createTime) {
        this.createTime = createTime;
    }

    public Date getUpdateTime() {
        return updateTime;
    }

    public void setUpdateTime(Date updateTime) {
        this.updateTime = updateTime;
    }

    @Override
    public String toString() {
        return "consultation{" +
                "id=" + id +
                ", patientId='" + patientId + '\'' +
                ", patientName='" + patientName + '\'' +
                ", bedNo='" + bedNo + '\'' +
                ", consultingDoctor='" + consultingDoctor + '\'' +
                ", diagnosis='" + diagnosis + '\'' +
                ", createTime=" + createTime +
                ", updateTime=" + updateTime +
                '}';
    }
}
