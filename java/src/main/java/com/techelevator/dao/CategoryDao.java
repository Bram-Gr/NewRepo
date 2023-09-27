package com.techelevator.dao;

import com.techelevator.model.Category;

import java.util.List;

public interface CategoryDao {
    public List<Category> getCategories();
    public List<Category> getQuizzesByCategoryId(int categoryId);
}
