package com.wl.domain;

import lombok.Data;

import java.util.Date;

@Data
public class Activity {
    private Integer id; // 如果需要 ID 字段
    private String activityName;
    private Date activityDate;
//    private String activityTime; // 或者使用 LocalTime
    private String activityLocation;
    private String activityDescription;

}
