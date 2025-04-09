package com.wl.controller;


import com.wl.domain.User;
import com.wl.domain.Vo.BorrowingBooksVo;
import com.wl.service.IBorrowingBooksRecordService;
import com.wl.service.IUserService;
import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import java.util.ArrayList;

@Controller
public class UserController {

    @Resource
    private IUserService userService;

    @Resource
    private IBorrowingBooksRecordService borrowingBooksRecordService;

//    @Resource
//    private IBookService bookService;



    @PostMapping("/userLogin")
    public String userLogin(@Param("userName") String userName,
                            @Param("password") String password, HttpServletRequest request) {
        User user = userService.userLogin(userName, password);
        
        if (null != user) {
            // flag = 0 表示用户名密码校验成功  【用于前端校验】
            request.getSession().setAttribute("flag", 0);

            request.getSession().setAttribute("user", user);
            return "user/index";
        }

        // flag 为 1 表示 登录失败 【用于前端校验】
        request.getSession().setAttribute("flag", 1);
        return "index";
    }


//    @RequestMapping("/isUserExist")
//    @ResponseBody
//    public String isUserExist(@Param("userName") String userName) {
//        List<User> users = userService.findUserByUserName(userName);
//        if (null == users) {
//            return "false";
//        }
//        if (users.size() < 1) {
//            return "false";
//        }
//        return "true";
//    }





    @RequestMapping("/userBorrowBookRecord")
    public String userBorrowBookRecord(Model model, HttpServletRequest request) {
        ArrayList<BorrowingBooksVo> res = borrowingBooksRecordService.selectAllBorrowRecord(request);
        model.addAttribute("borrowingBooksList", res);

        return "user/borrowingBooksRecord";
    }


    @RequestMapping("/userReturnBooksPage")
    public String userReturnBooksPage() {
        return "user/returnBooks";
    }

    @RequestMapping("/userMessagePage")
    public String userMessagePage(Model model, HttpServletRequest request) {
        User session_user = (User) request.getSession().getAttribute("user");
        User user = userService.findUserById(session_user.getUserId());
        model.addAttribute("message_user", user);
        return "user/userMessage";
    }


    @RequestMapping("/borrowingPage")
    public String borrowing() {
        return "user/borrowingBooks";
    }


    @RequestMapping("/userIndex")
    public String userIndex() {
        return "user/index";
    }


    @RequestMapping("/updateUser")
    @ResponseBody
    public boolean updateUser(User user, HttpServletRequest request) {
        return userService.updateUser(user, request);
    }


    @RequestMapping("/userReturnBook")
    @ResponseBody
    public boolean returnBook(int bookId, HttpServletRequest request) {
        return userService.userReturnBook(bookId, request);
    }


    @RequestMapping("/userBorrowingBook")
    @ResponseBody
    public boolean borrowingBook(int bookId, HttpServletRequest request) {
        System.out.println(bookId);
        return userService.userBorrowingBook(bookId, request);
    }


    @RequestMapping("/adminLoginPage")
    public String adminLoginPage() {
        return "adminLogin";
    }


    @RequestMapping("/userLogOut")
    public String userLogOut(HttpServletRequest request) {
        request.getSession().invalidate();
        return "index";
    }


    @RequestMapping("/findBookPage")
    public String findBookPage() {
        return "user/findBook";
    }



    @RequestMapping("/deleteUser")
    @ResponseBody
    public String deleteUserByUserId(@RequestParam("userId") int userId) {
        int res = userService.deleteUserById(userId);
        if (res > 0) {
            return "true";
        }
        return "false";
    }


    @RequestMapping("/addUser")
    @ResponseBody
    public String addUser(User user) {
        int res = userService.insertUser(user);
        if (res > 0) {
            return "true";
        } else {
            return "false";
        }
    }
    @RequestMapping("/guide")
    public String usageGuidelines() {
        return "user/guide";
    }


    @GetMapping("/notifications")
    public String getNotifications(Model model) {
        return "user/notice"; // 返回通知页面模板的名称
    }
    @GetMapping("/library-introduction")
    public String libraryIntroduction() {
        return "user/library_introduction";
    }

}
