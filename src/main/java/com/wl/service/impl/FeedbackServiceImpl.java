package com.wl.service.impl;

import com.wl.domain.Feedback;
import com.wl.mapper.FeedbackMapper;
import com.wl.service.IFeedbackService;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.List;

@Service
public class FeedbackServiceImpl implements IFeedbackService {

    @Resource
    private FeedbackMapper feedbackMapper;

    @Override
    public boolean addFeedback(Feedback feedback) {
        return feedbackMapper.insertFeedback(feedback) > 0;
    }

    @Override
    public List<Feedback> getAllFeedbacks() {
        return feedbackMapper.findAllFeedbacks();
    }
}
