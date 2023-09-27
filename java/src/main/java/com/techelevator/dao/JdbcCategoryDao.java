package com.techelevator.dao;

import com.techelevator.model.Category;
import org.springframework.dao.DataAccessException;
import org.springframework.http.HttpStatus;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.support.rowset.SqlRowSet;
import org.springframework.stereotype.Component;
import org.springframework.web.server.ResponseStatusException;

import java.util.ArrayList;
import java.util.List;

@Component
public class JdbcCategoryDao implements CategoryDao{
    private final JdbcTemplate jdbcTemplate;
    public JdbcCategoryDao(JdbcTemplate jdbcTemplate){
        this.jdbcTemplate = jdbcTemplate;
    }
    @Override
    public List<Category> getCategories(){
        List<Category> listOfCategories = new ArrayList<>();
        String sql = "SELECT * FROM categories;";
        try {
            SqlRowSet results = jdbcTemplate.queryForRowSet(sql);
            while(results.next()) {
                Category category = mapRowToCategory(results);
                listOfCategories.add(category);
            }
        } catch (DataAccessException e) {
            throw new ResponseStatusException(HttpStatus.BAD_REQUEST, "Cannot find list of categories");
        }
        return listOfCategories;
    }

    private Category mapRowToCategory(SqlRowSet rs){
        Category category = new Category();
        category.setCategoryId(rs.getInt("category_id"));
        category.setCategoryName(rs.getString("category_name"));
        return category;
    }



}
