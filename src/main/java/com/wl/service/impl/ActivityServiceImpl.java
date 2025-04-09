package com.wl.service.impl;

import com.wl.domain.Activity;
import com.wl.mapper.ActivityMapper;
import com.wl.service.IActivityService;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.List;

@Service
public class ActivityServiceImpl implements IActivityService {

    @Resource
    private ActivityMapper activityMapper; // 确保你的 Mapper 接口已经定义

    @Override
    public boolean addActivity(Activity activity) {
        return activityMapper.insertActivity(activity) > 0; // 确保你的 Mapper 中有这个方法
    }

    @Override
    public List<Activity> getAllActivities() {
        List<Activity> activities = activityMapper.selectAllActivities();
        // 去掉打印查询结果
        return activities;
    }



}


