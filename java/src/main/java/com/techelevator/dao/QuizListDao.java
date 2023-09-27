package com.techelevator.dao;

import com.techelevator.model.QuizList;

import java.util.List;

public interface QuizListDao {

//    public Quiz getQuizById(int quizId);
//    public List<String> getQuestionsByQuizId(int quizId);
//    public String getAnswerByQuestionId(int questionId);
    public List<QuizList> getQuizListByQuizId(int quizId);
    public List<QuizList> getQuizListByCategoryId(int quizId);

//    public void createQuiz(String question, String answer);//needs DTO
}
