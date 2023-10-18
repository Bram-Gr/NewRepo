import axios from 'axios'

export default {
    getQuizzesByQuizId(quizId){
        return axios.get(`quizzes/${quizId}/quizzes`);
    },
    getQuizzesByCategoryId(categoryId){
        return axios.get(`categories/${categoryId}/quizzes`);
    },
    getQuestionsByQuizId(quizId){
        return axios.get(`quiz/${quizId}`)
    },
    getQuizzesByUserId(userId){
        return axios.get(`users/${userId}/quizzes`)
    },
    createQuiz(userId, payload){
        return axios.post(`create-quiz/${userId}`, payload)
    }
}