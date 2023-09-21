package com.techelevator.dao;

import com.techelevator.model.Category;
import com.techelevator.model.Quiz;

import java.util.List;

public interface CategoryDao {
    public List<Category> getCategories();
}
