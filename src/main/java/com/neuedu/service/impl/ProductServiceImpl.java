package com.neuedu.service.impl;

import com.neuedu.dao.CategoryMapper;
import com.neuedu.dao.ProductMapper;
import com.neuedu.exception.MyException;
import com.neuedu.pojo.Category;
import com.neuedu.pojo.Product;
import com.neuedu.pojo.UserInfo;
import com.neuedu.service.IProductService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class ProductServiceImpl implements IProductService{
    @Autowired
    ProductMapper productMapper;
    @Override
    public List<Product> findAll() throws MyException {
        return productMapper.selectAll();
    }

    @Override
    public int deleteProduct(Product product) throws MyException {
        return productMapper.deleteByPrimaryKey(product.getId());
    }

    @Override
    public Product findProductById(int id) {
        return productMapper.selectByPrimaryKey(id);
    }

    @Override
    public int addProduct(Product product) throws MyException {
        return productMapper.insert(product);
    }

    @Override
    public int updateProduct(Product product) throws MyException {
        return productMapper.updateByPrimaryKey(product);
    }


}
