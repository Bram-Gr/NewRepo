import axios from 'axios'

export default {
    getQuizzesByCategoryId(categoryId){
        return axios.get(`categories/${categoryId}/quizzes`);
    }
}