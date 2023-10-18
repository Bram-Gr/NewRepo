package com.techelevator.controller;

import com.techelevator.dao.QuizDao;
import com.techelevator.dao.QuizListDao;
import com.techelevator.model.CreateQuizDTO;
import com.techelevator.model.Quiz;
import com.techelevator.model.QuizList;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@PreAuthorize("isAuthenticated()")
@RestController
@CrossOrigin
public class QuizController{

    private QuizListDao quizListDao;
    private QuizDao quizDao;

    public QuizController(QuizListDao quizListDao, QuizDao quizDao) {
        this.quizListDao = quizListDao;
        this.quizDao = quizDao;
    }


    @PreAuthorize("permitAll")
    @RequestMapping(path = "/quizzes/{quizId}/quizzes", method = RequestMethod.GET)
    public List<QuizList> getQuizListbyQuizId(@PathVariable int quizId){
        return quizListDao.getQuizListByQuizId(quizId);
    }
    @PreAuthorize("permitAll")
    @RequestMapping(path = "/categories/{categoryId}/quizzes", method = RequestMethod.GET)
    public List<QuizList> getQuizListbyCategoryId(@PathVariable int categoryId){
        return quizListDao.getQuizListByCategoryId(categoryId);
    }
    @PreAuthorize("permitAll")
    @RequestMapping(path = "/quiz/{quizId}", method = RequestMethod.GET)
    public List<Quiz> getQuestionsByQuizId(@PathVariable int quizId){
        return quizDao.getQuestionsByQuizId(quizId);
    }

    @PreAuthorize("permitAll")
    @RequestMapping(path = "/create-quiz/{userId}", method = RequestMethod.POST)
    public boolean createQuiz(@RequestBody CreateQuizDTO quiz, @PathVariable int userId){
        return quizDao.createQuiz(quiz, userId);
    }

    @PreAuthorize("permitAll")
    @RequestMapping(path = "/users/{userId}/quizzes", method = RequestMethod.GET)
    public List<QuizList> getQuizListByUserId(@PathVariable int userId){
        return quizListDao.getQuizListByUserId(userId);
    }
    @PreAuthorize("permitAll")
    @RequestMapping(path = "/users/{quizId}/delete-quiz", method = RequestMethod.GET)
    public boolean deleteQuiz(@PathVariable int quizId){
        return quizDao.deleteQuizByQuizId(quizId);
    }
}
