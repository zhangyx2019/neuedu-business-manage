package com.neuedu.service;

import com.neuedu.exception.MyException;
import com.neuedu.pojo.Category;
import com.neuedu.pojo.Product;
import com.neuedu.pojo.UserInfo;

import java.util.List;

public interface IProductService {

    public List<Product> findAll()throws MyException;

    public int deleteProduct(Product product)throws MyException;

    public Product findProductById(int id);

    public int addProduct(Product product)throws MyException;

    public int updateProduct(Product product)throws MyException;
}
