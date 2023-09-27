package com.techelevator.dao;

import com.techelevator.model.QuizList;

import java.util.List;

public interface QuizListDao {


    public List<QuizList> getQuizListByQuizId(int quizId);
    public List<QuizList> getQuizListByCategoryId(int categoryId);

}
