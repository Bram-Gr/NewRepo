package com.techelevator.dao;

import com.techelevator.exception.DaoException;
import com.techelevator.model.CreateQuizDTO;
import com.techelevator.model.Quiz;
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
public class JdbcQuizDao implements QuizDao{

    private final JdbcTemplate jdbcTemplate;

    public JdbcQuizDao(JdbcTemplate jdbcTemplate) {
        this.jdbcTemplate = jdbcTemplate;
    }
    @Override
    public List<Quiz> getQuestionsByQuizId(int quizId){
        List<Quiz> questionList = new ArrayList<>();
        String sql =
                "SELECT * FROM questions "
        +"Where quiz_id = ?";
        try {
            SqlRowSet results = jdbcTemplate.queryForRowSet(sql, quizId);
            while(results.next()) {
                Quiz quiz = mapRowToQuiz(results);
                questionList.add(quiz);
            }
        } catch (DataAccessException e) {
            throw new ResponseStatusException(HttpStatus.BAD_REQUEST, "Cannot find list of quizzes");
        }
        return questionList;
    }


    // the following method needs lots of testing
    @Override
    public boolean createQuiz (CreateQuizDTO quiz){
         String sql = "INSERT INTO quizzes (quiz_name, category_id)" +
                "VALUES(?, ?) returning quiz_id";
        String joinSql1 = "INSERT INTO questions (question_id, question, answer)" +
                "VALUES(?,?,?) returning quiz_id";
        String joinSql2 = "INSERT INTO users_quizzes (user_id)" +
                "VALUES(?) returning quiz_id";

        try {
            int newQuizId = jdbcTemplate.queryForObject(sql, int.class, quiz.getQuizId(),
                    quiz.getQuizName(), quiz.getCategoryId(), quiz.getQuestionId(),
                    quiz.getQuestion(), quiz.getAnswer(), quiz.getUserId());
            int newQuestionQuizId = jdbcTemplate.queryForObject(joinSql1, int.class, newQuizId);
            int userQuizId = jdbcTemplate.queryForObject(joinSql2, int.class, newQuizId);
            if (newQuizId > 0 && newQuestionQuizId > 0 && userQuizId > 0) {
                return true;
            }
        }catch(DataAccessException e){
            throw new DaoException("Could not create Quiz", e);
        }
        return false;
    }

    private Quiz mapRowToQuiz(SqlRowSet rs){
        Quiz quiz = new Quiz();
        quiz.setQuestionId(rs.getInt("question_id"));
        quiz.setQuizId(rs.getInt("quiz_id"));
        quiz.setQuestion(rs.getString("question"));
        quiz.setAnswer(rs.getString("answer"));

        return quiz;
    }
    //TODO see if you can consolidat the Jdbcs for quiz and quizList,
    // i kept them separate because I got invalide column names when i
    // included them in the select for getting the quizLists

}
