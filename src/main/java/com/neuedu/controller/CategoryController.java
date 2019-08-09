package com.neuedu.controller;


import com.neuedu.exception.MyException;
import com.neuedu.pojo.Category;
import com.neuedu.service.ICategoryService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.UnsupportedEncodingException;
import java.util.List;

@Controller
@RequestMapping("/user/category/")
public class CategoryController {
    @Autowired
    ICategoryService categoryService;

    @RequestMapping("find")
    public String findAll(HttpSession session){
        List<Category> categoryList=categoryService.findAll();
        session.setAttribute("categorylist",categoryList);
        return "category/list";
    }

    @RequestMapping(value = "update/{id}",method = RequestMethod.GET)
    public String update(@PathVariable("id") Integer categoryId, HttpServletRequest request){
        Category category=categoryService.findCategoryById(categoryId);

        request.setAttribute("category",category);

        return "category/update";
    }
    @RequestMapping(value = "update/{id}",method = RequestMethod.POST)
    public String update(Category category, HttpServletRequest request, HttpServletResponse response){

        try {
            request.setCharacterEncoding("UTF-8");
        } catch (UnsupportedEncodingException e) {
            e.printStackTrace();
        }
        response.setContentType("text/html;charset=UTF-8");
        int count=categoryService.updateCategory(category);

        if(count>0){
            return "redirect:/user/category/find";
        }
        return "category/update";
    }
    @RequestMapping(value = "update",method = RequestMethod.GET)
    public String add(){
        return "category/update";
    }
    @RequestMapping(value = "update",method = RequestMethod.POST)
    public String add(Category category){
        int count=categoryService.addCategory(category);
        if(count==1)
        {
            return "redirect:/user/category/find";
        }
        throw new MyException("新增类别失败","update");
    }
    @RequestMapping(value = "delect/{id}",method = RequestMethod.GET)
    public String delect(@PathVariable("id") Integer categoryId){
        Category category=categoryService.findCategoryById(categoryId);
        int count=categoryService.deleteCategory(category);
        if(count==1)
        {
            return "redirect:/user/category/find";
        }
        throw new MyException("删除失败","find");
    }
}
