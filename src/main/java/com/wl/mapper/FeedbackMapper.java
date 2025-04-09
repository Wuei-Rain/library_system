package com.wl.mapper;

import com.wl.domain.Feedback;

import java.util.List;

public interface FeedbackMapper {
    int insertFeedback(Feedback feedback);
    List<Feedback> findAllFeedbacks();
}
