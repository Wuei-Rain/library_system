package com.wl.mapper;

public interface StatisticsMapper {
    int getUserCount();
    int getBookCount();
    int getCategoryCount();
    int getActivityCount();
    int getCurrentlyBorrowedCount();
    int getFeedbackCount();
}
