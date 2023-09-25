package com.techelevator.dao;

import com.techelevator.model.Quiz;

import java.util.List;

public interface QuizDao {

//    public Quiz getQuizById(int quizId);
//    public List<String> getQuestionsByQuizId(int quizId);
//    public String getAnswerByQuestionId(int questionId);
    public List<Quiz> getQuizListByQuizId(int quizId);
    public List<Quiz> getQuizListByCategoryId(int quizId);

//    public void createQuiz(String question, String answer);//needs DTO
}
