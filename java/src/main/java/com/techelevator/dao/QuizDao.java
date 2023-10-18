package com.techelevator.dao;

import com.techelevator.model.CreateQuizDTO;
import com.techelevator.model.Quiz;
import com.techelevator.model.UpdateQuizDTO;

import java.util.List;

public interface QuizDao {
  public List<Quiz> getQuestionsByQuizId(int quizId);

  public boolean createQuiz (CreateQuizDTO quizDTO, int userId);

  public boolean deleteQuizByQuizId(int quizId);
  public boolean updateQuiz(UpdateQuizDTO quizDTO, int quizId);
}
