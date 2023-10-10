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
    createQuiz(id, payload){
        return axios.post(`users/${id}/quizzes`, payload)
    }
}