package com.techelevator.controller;

import com.techelevator.dao.CategoryDao;
import com.techelevator.dao.UserDao;
import com.techelevator.model.Category;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@PreAuthorize("isAuthenticated()")
@RestController
@CrossOrigin
public class CategoryController {
    private CategoryDao categoryDao;
    public CategoryController(CategoryDao categoryDao, UserDao userDao){
        this.categoryDao = categoryDao;
    }

    @PreAuthorize("permitAll")
    @RequestMapping(path = "/categories", method = RequestMethod.GET)//works
    public List<Category> getCategories() {
        return categoryDao.getCategories();
    }
}
