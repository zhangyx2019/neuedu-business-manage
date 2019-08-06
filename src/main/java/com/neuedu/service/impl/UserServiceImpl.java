package com.neuedu.service.impl;

import com.neuedu.dao.UserInfoMapper;
import com.neuedu.exception.MyException;
import com.neuedu.pojo.UserInfo;
import com.neuedu.service.IUserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class UserServiceImpl implements IUserService {
    @Autowired
    UserInfoMapper userInfoMapper;
    @Override
    public UserInfo login(UserInfo userInfo) throws MyException {
        if(userInfo==null){throw new MyException("参数不能为空");}
        if(userInfo.getUsername()==null||userInfo.getUsername().equals(""))
        {throw new MyException("用户名不能为空");}
        if(userInfo.getPassword()==null||userInfo.getPassword().equals(""))
        {throw new MyException("密码不能为空");}

        int username_result=userInfoMapper.exsitsUsername(userInfo.getUsername());
        if(username_result==0){throw new MyException("用户名不存在");}

        UserInfo userinfo_result=userInfoMapper.findByUsernameAndPassword(userInfo);
        if(userinfo_result==null){throw new MyException("密码错误");}

        if(userinfo_result.getRole()!=0){throw new MyException("没有权限访问");}
        return userinfo_result;
    }
}