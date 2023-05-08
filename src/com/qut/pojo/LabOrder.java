package com.qut.pojo;

import java.io.Serializable;
import java.util.Date;


/**
 * 检验单封装类
 */
public class LabOrder implements Serializable {
    private static final long serialVersionUID = 1L;
    private Integer id;
    private String patientId;
    private String certificateNo;
    private String patientName;
    private String bedNo;
    private String items;
    private String DoctorName;
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

    public String getCertificateNo() {
        return certificateNo;
    }

    public void setCertificateNo(String certificateNo) {
        this.certificateNo = certificateNo;
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

    public String getItems() {
        return items;
    }

    public void setItems(String items) {
        this.items = items;
    }

    public String getDoctorName() {
        return DoctorName;
    }

    public void setDoctorName(String doctorName) {
        DoctorName = doctorName;
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
        return "LabOrder{" +
                "id=" + id +
                ", patientId='" + patientId + '\'' +
                ", certificateNo='" + certificateNo + '\'' +
                ", patientName='" + patientName + '\'' +
                ", bedNo='" + bedNo + '\'' +
                ", items='" + items + '\'' +
                ", DoctorName='" + DoctorName + '\'' +
                ", createTime=" + createTime +
                ", updateTime=" + updateTime +
                '}';
    }
}
