package com.techelevator.dao;

import com.techelevator.model.QuizList;
import org.springframework.dao.DataAccessException;
import org.springframework.http.HttpStatus;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.support.rowset.SqlRowSet;
import org.springframework.stereotype.Component;
import org.springframework.web.server.ResponseStatusException;

import java.util.ArrayList;
import java.util.List;



@Component
public class JdbcQuizListDao implements QuizListDao {

    private final JdbcTemplate jdbcTemplate;

    public JdbcQuizListDao(JdbcTemplate jdbcTemplate) {
        this.jdbcTemplate = jdbcTemplate;
    }

    @Override
    public List<QuizList> getQuizListByQuizId(int quizId){
        List<QuizList> quizList = new ArrayList<>();
        String sql =
                "SELECT * FROM quizzes "  +
        "JOIN questions ON quizzes.quiz_id = questions.quiz_id "+
        "Where quizzes.quiz_id = ?";
        try {
            SqlRowSet results = jdbcTemplate.queryForRowSet(sql, quizId);
            while(results.next()) {
                QuizList quiz = mapRowToQuiz(results);
                quizList.add(quiz);
            }
        } catch (DataAccessException e) {
            throw new ResponseStatusException(HttpStatus.BAD_REQUEST, "Cannot find list of quizzes");
        }
        return quizList;
    }
    @Override
    public List<QuizList> getQuizListByCategoryId(int categoryId){
        List<QuizList> quizList = new ArrayList<>();
        String sql ="SELECT * FROM quizzes "+
        "JOIN categories ON quizzes.category_id = categories.category_id "+
        "Where quizzes.category_id =?";
        try {
            SqlRowSet results = jdbcTemplate.queryForRowSet(sql, categoryId);
            while(results.next()) {
                QuizList quiz = mapRowToQuiz(results);
                quizList.add(quiz);
            }
        } catch (DataAccessException e) {
            throw new ResponseStatusException(HttpStatus.BAD_REQUEST, "Cannot find list of quizzes");
        }
        return quizList;
    }

    @Override
    public List<QuizList> getQuizListByUserId(int userId){
        List<QuizList> quizList = new ArrayList<>();
        String sql ="SELECT * FROM quizzes "+
                "JOIN users_quizzes ON users_quizzes.quiz_id = quizzes.quiz_id "+
                "Where users_quizzes.user_id =?";
        try {
            SqlRowSet results = jdbcTemplate.queryForRowSet(sql, userId);
            while(results.next()) {
                QuizList quiz = mapRowToQuiz(results);
                quizList.add(quiz);
            }
        } catch (DataAccessException e) {
            throw new ResponseStatusException(HttpStatus.BAD_REQUEST, "Cannot find list of quizzes");
        }
        return quizList;
    }
private QuizList mapRowToQuiz(SqlRowSet rs){
        QuizList quiz = new QuizList();
        quiz.setQuizId(rs.getInt("quiz_id"));
        quiz.setQuizName(rs.getString("quiz_name"));
        quiz.setCategoryId(rs.getInt("category_id"));
        return quiz;
    }
}
