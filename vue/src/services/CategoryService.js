import axios from 'axios'

export default {
    getCategories(){
        return axios.get(`/categories/`)
    },
    // getQuizzesByCategoryId(categoryId){
    //     return axios.get(`/categories/${categoryId}`)
    // }
}