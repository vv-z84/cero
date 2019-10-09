import axios from "axios"

const client = axios.create({
    baseURL: "http://sku.eastus.cloudapp.azure.com:3000/"
})

const requestInterceptor = (async config => {
    const token = getToken()
    if(token)
        config.headers.Authorization = `Bearer ${token}`
    return config
})

client.interceptors.request.use(requestInterceptor)

const login = token => { localStorage.setItem(TOKEN_KEY, token) }
const logout = () => { localStorage.removeItem(TOKEN_KEY) }
const getToken = () => { localStorage.getItem(TOKEN_KEY) }
const isAuthenticated = () => localStorage.getItem(TOKEN_KEY) !== null
const TOKEN_KEY = "cero_id"

export { 
    client,
    login,
    logout,
    getToken,
    isAuthenticated
}
