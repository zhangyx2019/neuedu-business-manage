package com.neuedu.service;

import com.neuedu.exception.MyException;
import com.neuedu.pojo.Category;
import com.neuedu.pojo.UserInfo;
import org.springframework.stereotype.Service;

import java.util.List;

public interface IUserService {

    public UserInfo login(UserInfo userInfo)throws MyException;

    public List<UserInfo> findAll()throws MyException;

    public UserInfo findUserInfoById(int id);

    public int deleteUserInfo(UserInfo userInfo)throws MyException;

    public int addUserInfo(UserInfo userInfo)throws MyException;

    public int updateUserInfo(UserInfo userInfo)throws MyException;
}
