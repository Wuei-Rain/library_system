package com.wl.service;

import com.wl.domain.Activity;

import java.util.List;

public interface IActivityService {

    boolean addActivity(Activity activity);
    List<Activity> getAllActivities();
}
