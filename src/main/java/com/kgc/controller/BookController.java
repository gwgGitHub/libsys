package com.kgc.controller;

import com.github.pagehelper.PageInfo;
import com.kgc.pojo.Book;
import com.kgc.pojo.BookType;
import com.kgc.service.BookService;
import com.kgc.service.BookTypeService;
import com.kgc.utils.PageUtil;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpSession;
import java.util.Date;
import java.util.List;

/**
 * @author 张亮
 * @date 2019-06-21 21:41
 */
@Controller
@RequestMapping("/book")
public class BookController {
    
    @Autowired
    BookService bookService;
    
    @Autowired
    BookTypeService bookTypeService;
    
    //用于前台显示操作成功与否的信息-增-删-改
    private String showRUDMessage = null;
    
    /**
     * 分页查询
     *
     * @param pageUtil 条件工具类,封装前台参数
     * @param model    作用域
     * @param session  作用域
     * @return list页面
     */
    @RequestMapping(value = "/list")
    public String getList(PageUtil pageUtil, Model model, HttpSession session) {
        //图书条件查询,并存request作用域
        PageInfo<Book> pageInfo = bookService.getListByPage(pageUtil);
        model.addAttribute("pageInfo", pageInfo);
        
        //图书信息是否为空,并存放信息到作用域
        String showListMessage;
        if (pageInfo.getTotal() == 0) {
            showListMessage = "没有符合条件的记录!";
        } else {
            showListMessage = null;
        }
        model.addAttribute("showListMessage", showListMessage);
        
        //图书类型查询,存session作用域
        List<BookType> bookTypes = bookTypeService.getList();
        session.setAttribute("bookTypes", bookTypes);
        
        //pageUtil,前台参数,存放到request作用域
        model.addAttribute("pageUtil", pageUtil);
        
        //增删改提示,存放request作用域
        model.addAttribute("showRUDMessage", this.showRUDMessage);
        this.showRUDMessage = null;
        
        //视图页面
        if ("1".equals(session.getAttribute("requestType"))) {
            return "lista";
        } else {
            return "listu";
        }
    }
    
    /**
     * 前台请求前往add页面
     *
     * @return list页面
     */
    @RequestMapping(value = "/add", method = RequestMethod.GET)
    public String addpage() {
        return "add";
    }
    
    /**
     * 添加图书
     *
     * @param book pojo类封装前台参数
     * @return 响应体 js
     */
    @RequestMapping(value = "/addbook", method = RequestMethod.POST, produces = "text/html;charset=UTF-8")
    @ResponseBody
    public String addBook(Book book) {
        //设置书籍创建时间
        book.setCreationTime(new Date());
        //设置书籍修改时间
        book.setLastUpdateTime(new Date());
        if (bookService.add(book)) {
            this.showRUDMessage = "添加成功!";
            return "<script>location.href='/book/list';</script>";
        } else {
            return "<script>alert('添加失败!');history.go(-1);</script>";
        }
    }
    
    /**
     * 前台请求前往详细或修改的页面
     *
     * @param bookId 图书id
     * @param state  请求的类型:1,详细 OR 2,修改
     * @param model  作用域
     * @return detail页面 OR update 页面
     */
    @RequestMapping(value = "/getbook", method = RequestMethod.GET)
    public String getBook(Integer bookId, Integer state, Model model) {
        //根据id查询图书,并存放作用域
        Book book = bookService.getById(bookId);
        model.addAttribute("book", book);
        //三元:根据state判断前往的页面
        return state == 1 ? "detail" : "update";
    }
    
    /**
     * 修改图书
     *
     * @param book pojo类封装前台参数
     * @return 响应体 js
     */
    @RequestMapping(value = "/update", method = RequestMethod.POST, produces = "text/html;charset=UTF-8")
    @ResponseBody
    public String updateBook(Book book) {
        //设置书籍更新时间
        book.setLastUpdateTime(new Date());
        if (bookService.updata(book)) {
            this.showRUDMessage = "修改成功!";
            return "<script>location.href='/book/list';</script>";
        } else {
            return "<script>alert('修改失败!');history.go(-1);</script>";
        }
    }
    
    /**
     * 删除图书
     *
     * @param bookId 图书id
     * @return 响应体 js
     */
    @RequestMapping(value = "/deletebook", method = RequestMethod.GET)
    public String deleteBook(Integer bookId) {
        if (bookService.delete(bookId)) {
            this.showRUDMessage = "删除成功!";
            return "redirect:/book/list";
        } else {
            this.showRUDMessage = "删除失败!";
            return "redirect:/book/list";
        }
    }
    
    /**
     * 借书
     *
     * @param bookId 书籍id
     * @return 请求
     */
    @RequestMapping(value = "/borrow")
    public String borrow(Integer bookId) {
        //获取书籍信息
        Book book = bookService.getById(bookId);
        //设置书籍状态
        book.setIsBorrow(1);
        //返回页面
        if (bookService.updata(book)) {
            this.showRUDMessage = "借阅成功!";
            return "redirect:/book/list";
        } else {
            this.showRUDMessage = "借阅失败!";
            return "redirect:/book/list";
        }
    }
    
    /**
     * 归还
     *
     * @param bookId 书籍id
     * @return 请求
     */
    @RequestMapping(value = "/reback")
    public String reback(Integer bookId) {
        //获取书籍信息
        Book book = bookService.getById(bookId);
        //设置书籍状态
        book.setIsBorrow(0);
        if (bookService.updata(book)) {
            this.showRUDMessage = "归还成功!";
            return "redirect:/book/list";
        } else {
            this.showRUDMessage = "归还失败!";
            return "redirect:/book/list";
        }
    }
}
