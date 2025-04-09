package com.wl.controller;

import com.wl.domain.Activity;
import com.wl.service.IActivityService;
import org.springframework.beans.propertyeditors.CustomDateEditor;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.WebDataBinder;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import javax.annotation.Resource;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

@Controller
public class ActivityController {

    @Resource
    private IActivityService activityService;

    @InitBinder
    public void initBinder(WebDataBinder binder) {
        SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");
        dateFormat.setLenient(false);
        binder.registerCustomEditor(Date.class, new CustomDateEditor(dateFormat, true));
    }

    @RequestMapping("/publishActivity")
    public String showPublishActivityPage() {
        return "admin/publishActivity"; // 返回 publishActivity.html 页面
    }

    @PostMapping("/addActivity")
    public String addActivity(Activity activity, RedirectAttributes redirectAttributes) {
        try {
            boolean result = activityService.addActivity(activity);
            if (result) {
                redirectAttributes.addFlashAttribute("message", "活动发布成功！");
                return "redirect:/activitySuccess";
            } else {
                redirectAttributes.addFlashAttribute("error", "活动发布失败，请重试！");
                return "redirect:/publishActivity"; // 发布失败时返回发布页面
            }
        } catch (Exception e) {
            redirectAttributes.addFlashAttribute("error", "活动发布失败：" + e.getMessage());
            return "redirect:/activitySuccess"; // 捕获异常并返回发布页面
        }
    }

    @GetMapping("/activitySuccess")
    public String showActivitySuccessPage() {
        return "admin/activitySuccess";
    }



    @GetMapping("/activityList")
    public String showActivityList(Model model) {
        List<Activity> activities = activityService.getAllActivities();
        model.addAttribute("activities", activities);
        return "user/activityList";
    }

}
