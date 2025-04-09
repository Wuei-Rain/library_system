package com.wl.service.impl;

import com.wl.mapper.StatisticsMapper;
import com.wl.service.StatisticsService;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;

@Service
public class StatisticsServiceImpl implements StatisticsService {
    @Resource
    private StatisticsMapper statisticsMapper;
    @Override
    public int getUserCount() {
        return statisticsMapper.getUserCount();
    }

    @Override
    public int getBookCount() {
        return statisticsMapper.getBookCount();
    }

    @Override
    public int getCategoryCount() {
        return statisticsMapper.getCategoryCount();
    }

    @Override
    public int getActivityCount() {
        return statisticsMapper.getActivityCount();
    }

    @Override
    public int getCurrentlyBorrowedCount() {
        return statisticsMapper.getCurrentlyBorrowedCount();
    }
    @Override
    public int getFeedbackCount() {
        return statisticsMapper.getFeedbackCount();
    }
}
