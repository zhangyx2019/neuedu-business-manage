package com.neuedu.controller;

import com.neuedu.consts.Const;
import com.neuedu.exception.MyException;
import com.neuedu.pojo.Category;
import com.neuedu.pojo.Product;
import com.neuedu.pojo.UserInfo;
import com.neuedu.service.IUserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.UnsupportedEncodingException;
import java.util.List;

@Controller
@RequestMapping("/user/")
public class UserController {
    @Autowired
    IUserService userService;
    @RequestMapping(value = "login",method = RequestMethod.GET)
    public String login(){
        return "login";
    }
    @RequestMapping(value = "login",method = RequestMethod.POST)
    public String login(UserInfo userInfo, HttpSession session, HttpServletResponse response){
        UserInfo loginUserInfo=userService.login(userInfo);
        if(loginUserInfo!=null){
            session.setAttribute(Const.CURRENT_USER,loginUserInfo);

            Cookie username_cookie=new Cookie("username",userInfo.getUsername());
            Cookie password_cookie=new Cookie("password",userInfo.getPassword());
            username_cookie.setMaxAge(60*60*24*7);
            password_cookie.setMaxAge(60*60*24*7);
            response.addCookie(username_cookie);
            response.addCookie(password_cookie);

            return "home/home";
        }
        return "login";
    }
    @RequestMapping("home")
    public String home(){
        return "home";
    }


    @RequestMapping("find")
    public String findAll(HttpSession session){
        List<UserInfo> userInfoList=userService.findAll();
        session.setAttribute("userInfolist",userInfoList);
        return "user/list";
    }

    @RequestMapping(value = "update/{id}",method = RequestMethod.GET)
    public String update(@PathVariable("id") Integer id, HttpServletRequest request){
        UserInfo userInfo=userService.findUserInfoById(id);

        request.setAttribute("userinfo",userInfo);

        return "user/update";
    }
    @RequestMapping(value = "update/{id}",method = RequestMethod.POST)
    public String update(UserInfo userInfo, HttpServletRequest request, HttpServletResponse response){
        try {
            request.setCharacterEncoding("UTF-8");
        } catch (UnsupportedEncodingException e) {
            e.printStackTrace();
        }
        response.setContentType("text/html;charset=UTF-8");
        int count=userService.updateUserInfo(userInfo);

        if(count>0){
            return "redirect:/user/find";
        }
        return "user/update";
    }
    @RequestMapping(value = "update",method = RequestMethod.GET)
    public String add(){
        return "user/update";
    }
    @RequestMapping(value = "update",method = RequestMethod.POST)
    public String add(UserInfo userInfo){
        int count=userService.addUserInfo(userInfo);
        if(count==1)
        {
            return "redirect:/user/find";
        }
        throw new MyException("新增用户失败","update");
    }

    @RequestMapping(value = "delect/{id}",method = RequestMethod.GET)
    public String delect(@PathVariable("id") Integer id){
        UserInfo userInfo=userService.findUserInfoById(id);
        int count=userService.deleteUserInfo(userInfo);
        if(count==1)
        {
            return "redirect:/user/find";
        }
        throw new MyException("删除失败","find");
    }
}
