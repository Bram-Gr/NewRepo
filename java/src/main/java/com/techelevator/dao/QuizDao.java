package com.techelevator.dao;

import com.techelevator.model.CreateQuizDTO;
import com.techelevator.model.Quiz;

import java.util.List;

public interface QuizDao {
  public List<Quiz> getQuestionsByQuizId(int quizId);

  public boolean createQuiz (CreateQuizDTO quizDTO);
}
