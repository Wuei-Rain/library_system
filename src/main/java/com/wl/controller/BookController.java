package com.wl.controller;

import com.wl.domain.Book;
import com.wl.domain.BookCategory;
import com.wl.domain.Vo.BookVo;
import com.wl.service.IAdminService;
import com.wl.service.IBookCategoryService;
import com.wl.service.IBookService;
import com.wl.service.StatisticsService;
import com.wl.utils.page.Page;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.annotation.Resource;
import java.util.Collections;
import java.util.List;

@Controller
public class BookController {
    @Resource
    private IAdminService adminService;
    @Resource
    private IBookService bookService;
    @Resource
    private IBookCategoryService bookCategoryService;


    @RequestMapping("/addBook")
    @ResponseBody
    public String addBook(Book book) {
        boolean res = adminService.addBook(book);
        if (res) {
            return "true";
        }
        return "false";
    }


    @RequestMapping("/showBooksResultPageByCategoryId")
    public String showBooksResultPageByCategoryId(@RequestParam("pageNum") int pageNum, @RequestParam("bookCategory") int bookCategory, Model model) {
        Page<BookVo> page = bookService.findBooksByCategoryId(bookCategory, pageNum);
        model.addAttribute("page", page);
        model.addAttribute("bookCategory", bookCategory);
        return "admin/findBooks";
    }


    @RequestMapping("/findBookByBookPartInfo")
    public String findBooksResultPage(@RequestParam("bookPartInfo") String bookPartInfo, Model model) {

        List<BookVo> bookVos = bookService.selectBooksByBookPartInfo(bookPartInfo);

        model.addAttribute("bookList", bookVos);
        return "user/findBook";
    }
    @RequestMapping("/findBookByBookPartInfos")
    public String findBooksResultPages(@RequestParam("bookPartInfo") String bookPartInfo, Model model) {

        List<BookVo> bookVos = bookService.selectBooksByBookPartInfo(bookPartInfo);

        model.addAttribute("bookList", bookVos);
        return "admin/findBooks";
    }

    @RequestMapping("/findAllBookCategory")
    @ResponseBody
    public List<BookCategory> findAllBookCategory() {
        return adminService.getBookCategories();
    }


    @RequestMapping("/addBookCategory")
    @ResponseBody
    public String addBookCategory(BookCategory bookCategory) {
        boolean result = adminService.addBookCategory(bookCategory);
        return result ? "true" : "false";
    }



    @RequestMapping("/deleteCategory")
    @ResponseBody
    public String deleteBookCategoryById(@RequestParam("bookCategoryId") int bookCategoryId) {
        int res = bookCategoryService.deleteBookCategoryById(bookCategoryId);
        if (res > 0) {
            return "true";
        }
        return "false";
    }
    @RequestMapping("/bookListPage")
    public String getBookList(Model model) {
        List<Book> books = bookService.getAllBooks(); // 确保这个方法返回的书籍列表不为空
        model.addAttribute("bookList", books);
        return "user/bookList"; // 确保视图名称是正确的
    }
    @GetMapping("/userLogin")
    public String libraryHomePage() {
        return "user/index";
    }
    @Resource
    private StatisticsService statisticsService;
    @GetMapping("/adminLogin")
    public String libraryHomePages(Model model) {
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
        return "admin/index";
    }

    @RequestMapping("/searchBooks")
    @ResponseBody
    public List<BookVo> searchBooks(@RequestParam("query") String query) {
        List<BookVo> books = bookService.searchBooksByQuery(query); // 检查这个方法是否返回正确的数据
        return books != null ? books : Collections.emptyList();
    }





}
