package com.techelevator.dao;

import com.techelevator.model.Quiz;

import java.util.List;

public interface QuizDao {
    public Quiz getQuizByCategoryId(int category);
    public Quiz getQuizById(int quizId);
    public List<String> getQuestionsByQuizId(int quizId);
    public String getAnswerByQuestionId(int questionId);


    public void createQuiz(String question, String answer);//needs DTO
}
