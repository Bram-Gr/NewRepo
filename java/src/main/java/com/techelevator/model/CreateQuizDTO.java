package com.techelevator.model;

import java.util.List;

public class CreateQuizDTO {
    private int quizId;
    private String quizName;
    private final int categoryId = 6;
    private int questionId;
    private String question;
    private String answer;
    private int userId;
    private List<QuestionAnswerDTO> questionAnswers;
    private final String categoryName = "Custom Quizzes";

    public List<QuestionAnswerDTO> getQuestionAnswers() {
        return questionAnswers;
    }

    public void setQuestionAnswers(List<QuestionAnswerDTO> questionAnswers) {
        this.questionAnswers = questionAnswers;
    }

    public int getQuizId() {
        return quizId;
    }

    public void setQuizId(int quizId) {
        this.quizId = quizId;
    }

    public String getQuizName() {
        return quizName;
    }

    public void setQuizName(String quizName) {
        this.quizName = quizName;
    }

    public int getCategoryId() {
        return categoryId;
    }

    public int getQuestionId() {
        return questionId;
    }

    public void setQuestionId(int questionId) {
        this.questionId = questionId;
    }

    public String getQuestion() {
        return question;
    }

    public void setQuestion(String question) {
        this.question = question;
    }

    public String getAnswer() {
        return answer;
    }

    public void setAnswer(String answer) {
        this.answer = answer;
    }

    public int getUserId() {
        return userId;
    }

    public void setUserId(int userId) {
        this.userId = userId;
    }

    public String getCategoryName() {
        return categoryName;
    }
}
