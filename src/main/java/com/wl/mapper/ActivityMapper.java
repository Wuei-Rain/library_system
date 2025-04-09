package com.wl.mapper;

import com.wl.domain.Activity;

import java.util.List;

public interface ActivityMapper {
    int insertActivity(Activity activity); // 插入活动的方法
    List<Activity> selectAllActivities(); // 添加此方法以查询所有活动

}
