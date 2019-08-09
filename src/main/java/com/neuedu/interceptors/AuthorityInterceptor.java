package com.neuedu.interceptors;

import com.neuedu.pojo.UserInfo;
import com.neuedu.service.IUserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.stereotype.Controller;
import org.springframework.web.servlet.HandlerInterceptor;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@Component
public class AuthorityInterceptor implements HandlerInterceptor{
    @Autowired
    IUserService userService;
    @Override
    public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler) {
        HttpSession session=request.getSession();

        Cookie[] cookies=request.getCookies();
        String username=null;
        String password=null;
        if(cookies!=null&&cookies.length>0){
            for(Cookie c:cookies){
                if (c.getName().equals("username")){
                    username=c.getValue();
                    System.out.println(username);
                }
                if (c.getName().equals("password")){
                    password=c.getValue();
                    System.out.println(password);
                }
            }
        }
        UserInfo userInfo=new UserInfo();
        UserInfo userInfo2=new UserInfo();
        if(username!=null&&password!=null){
            userInfo.setUsername(username);
            userInfo.setPassword(password);
            System.out.println(userInfo);
            userInfo2=userService.login(userInfo);
            System.out.println(userInfo2);
            if(userInfo2!=null){
                session.setAttribute("userinfo",userInfo2);
            }
        }
        UserInfo userInfo1=(UserInfo)session.getAttribute("userinfo");
        System.out.println(userInfo1);
        if(userInfo1!=null&&userInfo1.getRole()==0){
            return true;
        }
        return false;
    }

    @Override
    public void postHandle(HttpServletRequest request, HttpServletResponse response, Object handler, ModelAndView modelAndView) {

    }

    @Override
    public void afterCompletion(HttpServletRequest request, HttpServletResponse response, Object handler, Exception ex) {

    }
}
