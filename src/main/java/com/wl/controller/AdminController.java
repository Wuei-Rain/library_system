package com.wl.controller;

import com.wl.domain.Admin;
import com.wl.domain.BookCategory;
import com.wl.domain.User;
import com.wl.domain.Vo.BookVo;
import com.wl.service.IAdminService;
import com.wl.service.IBookCategoryService;
import com.wl.service.IUserService;
import com.wl.service.StatisticsService;
import com.wl.utils.page.Page;
import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

@Controller
public class AdminController {

    @Resource
    private IAdminService adminService;
    @Resource
    private IBookCategoryService bookCategoryService;
    @Resource
    private IUserService userService;

    @RequestMapping("/isAdminExist")
    @ResponseBody
    public String adminIsExist(@Param("adminName") String adminName) {
        boolean b = adminService.adminIsExist(adminName);
        if (b) {
            return "true";
        } else {
            return "false";
        }
    }


//    @PostMapping("/adminLogin")
//    public String adminLogin(@Param("userName") String userName, @Param("password") String password, HttpServletRequest request) {
//        Admin admin = adminService.adminLogin(userName, password);
//
//        if (admin == null) {
//            // flag 为 1 表示 登录失败
//            request.getSession().setAttribute("flag", 1);
//            return "index";
//        }
//
//        request.getSession().setAttribute("flag", 0);
//        request.getSession().setAttribute("admin", admin);
//        return "admin/index";
//    }


    @RequestMapping("/addBookPage")
    public String addBookPage() {
        return "admin/addBook";
    }


    @RequestMapping("/addCategoryPage")
    public String addCategoryPage(@RequestParam("pageNum") int pageNum, Model model) {
        Page<BookCategory> page = bookCategoryService.selectBookCategoryByPageNum(pageNum);
        model.addAttribute("page", page);
        return "admin/addCategory";
    }



    @RequestMapping("/adminIndex")
    public String returnAdminIndexPage() {
        return "admin/index";
    }


    @RequestMapping("/showUsersPage")
    public String showUsersPage(Model model, @RequestParam("pageNum") int pageNum) {
        Page<User> page = userService.findUserByPage(pageNum);
        model.addAttribute("page", page);
        return "admin/userManage";
    }


    @RequestMapping("/showBooksPage")
    public String showBooksPage(Model model) {
        Page<BookVo> page = new Page<BookVo>();
        page.setPageCount(1);
        page.setPageNum(1);
        model.addAttribute("page", page);
        return "admin/findBooks";
    }


    @RequestMapping("/adminLogOut")
    public String userLogOut(HttpServletRequest request) {
        request.getSession().invalidate();
        return "index";
    }


    @RequestMapping("/addUserPage")
    public String addUserPage() {
        return "admin/addUser";
    }

    @RequestMapping("/adminInfoPage")
    public String adminInfo() {
        return "admin/userMessage";
    }


    @RequestMapping("/updateAdmin")
    @ResponseBody
    public boolean updateAdmin(Admin admin, HttpServletRequest request) {
        return adminService.updateAdmin(admin, request);
    }
    @Resource
    private StatisticsService statisticsService;

    @PostMapping("/adminLogin")
    public String adminLogin(@RequestParam("userName") String userName, @RequestParam("password") String password, HttpServletRequest request, Model model) {
        Admin admin = adminService.adminLogin(userName, password);

        if (admin == null) {
            // flag 为 1 表示 登录失败
            request.getSession().setAttribute("flag", 1);
            return "index";
        }

        request.getSession().setAttribute("flag", 0);
        request.getSession().setAttribute("admin", admin);

        int userCount = statisticsService.getUserCount();
        int bookCount = statisticsService.getBookCount();
        int categoryCount = statisticsService.getCategoryCount();
        int activityCount = statisticsService.getActivityCount();
        int currentlyBorrowedCount = statisticsService.getCurrentlyBorrowedCount();
        int feedbackCount = statisticsService.getFeedbackCount();  // 获取反馈信息量


        model.addAttribute("userCount", userCount);
        model.addAttribute("bookCount", bookCount);
        model.addAttribute("categoryCount", categoryCount);
        model.addAttribute("activityCount", activityCount);
        model.addAttribute("currentlyBorrowedCount", currentlyBorrowedCount);
        model.addAttribute("feedbackCount", feedbackCount);  // 将反馈信息量添加到模型


        return "admin/index"; // 返回到带有统计数据的页面
    }
}
