package com.wl.controller;

import com.wl.domain.Feedback;
import com.wl.service.IFeedbackService;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.annotation.Resource;
import java.sql.Timestamp;
import java.time.LocalDateTime;
import java.util.List;

@Controller
public class FeedbackController {

    @Resource
    private IFeedbackService feedbackService;

    @GetMapping("/feedbackForm")
    public String feedbackForm() {
        return "user/contact";
    }

    @PostMapping("/submitFeedback")
    @ResponseBody
    public String submitFeedback(@RequestParam("username") String username,
                                 @RequestParam("email") String email,
                                 @RequestParam("message") String message) {
        Feedback feedback = new Feedback();
        feedback.setUsername(username);
        feedback.setEmail(email);
        feedback.setMessage(message);
        feedback.setCreatedAt(Timestamp.valueOf(LocalDateTime.now()));
        boolean success = feedbackService.addFeedback(feedback);

        return success ? "反馈成功" : "反馈失败";
    }

    @GetMapping("/feedbackList")
    public String feedbackList(Model model) {
        List<Feedback> feedbacks = feedbackService.getAllFeedbacks();
        feedbacks.forEach(feedback -> {
//            System.out.println("Feedback: " + feedback.getUsername() + ", CreatedAt: " + feedback.getCreatedAt());
        });
        model.addAttribute("feedbacks", feedbacks);
        return "admin/feedbackList";
    }

}
