package com.neuedu.controller;

import com.neuedu.exception.MyException;
import com.neuedu.pojo.Category;
import com.neuedu.pojo.Product;
import com.neuedu.service.ICategoryService;
import com.neuedu.service.IProductService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.File;
import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.util.List;
import java.util.UUID;

@Controller
@RequestMapping("/user/product/")
public class ProductController {
    @Autowired
    IProductService productService;
    @Autowired
    ICategoryService categoryService;

    @RequestMapping("find")
    public String findAll(HttpSession session){
        List<Product> productList=productService.findAll();
        session.setAttribute("productlist",productList);
        return "product/list";
    }

    @RequestMapping(value = "delect/{id}",method = RequestMethod.GET)
    public String delect(@PathVariable("id") Integer productId){
        Product product=productService.findProductById(productId);
        int count=productService.deleteProduct(product);
        if(count==1)
        {
            return "redirect:/user/product/find";
        }
        throw new MyException("删除失败","find");
    }
    @RequestMapping(value = "update/{id}",method = RequestMethod.GET)
    public String update(@PathVariable("id") Integer productId, HttpServletRequest request,HttpSession session){
        Product product=productService.findProductById(productId);
        List<Category> categoryList=categoryService.findAll();
        session.setAttribute("categorylist",categoryList);
        List<Category> productList=categoryService.findAll();
        session.setAttribute("productlist",productList);
        request.setAttribute("product",product);

        return "product/update";
    }
    @RequestMapping(value = "update/{id}",method = RequestMethod.POST)
    public String update(@RequestParam("picfile")MultipartFile uploadFile,Product product, HttpServletRequest request, HttpServletResponse response){

        try {
            request.setCharacterEncoding("UTF-8");
        } catch (UnsupportedEncodingException e) {
            e.printStackTrace();
        }
        response.setContentType("text/html;charset=UTF-8");

//        if(uploadFile!=null){
//            String uuid= UUID.randomUUID().toString();
//            String fileName=uploadFile.getOriginalFilename();
//            String fileextendname=fileName.substring(fileName.lastIndexOf("."));
//            String newFileName=uuid+fileextendname;
//            File file=new File("F:\\upload");
//            File newfile=new File(file,newFileName);
//            try {
//                uploadFile.transferTo(newfile);
//            } catch (IOException e) {
//                e.printStackTrace();
//            }
//        }

        int count=productService.updateProduct(product);
        if(count>0){
            return "redirect:/user/product/find";
        }
        return "product/update";
    }
    @RequestMapping(value = "update",method = RequestMethod.GET)
    public String add(HttpSession session){
        List<Category> categoryList=categoryService.findAll();
        session.setAttribute("categorylist",categoryList);
        List<Category> productList=categoryService.findAll();
        session.setAttribute("productlist",productList);

        return "product/update";
    }
    @RequestMapping(value = "update",method = RequestMethod.POST)
    public String add(Product product){
        int count=productService.addProduct(product);
        if(count==1)
        {
            return "redirect:/user/product/find";
        }
        throw new MyException("新增产品失败","update");
    }
}
