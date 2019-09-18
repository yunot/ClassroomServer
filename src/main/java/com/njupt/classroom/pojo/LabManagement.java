package com.njupt.classroom.pojo;

import lombok.Data;

@Data
public class LabManagement {
    private Integer labId;

    private String labName;

    private Boolean mainLab;

    private Boolean otherLab;

    private Boolean openLab;

    private Integer tableNum;
}