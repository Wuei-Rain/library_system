package com.wl.service;

import com.wl.domain.Feedback;
import java.util.List;

public interface IFeedbackService {
    boolean addFeedback(Feedback feedback);
    List<Feedback> getAllFeedbacks();
}
