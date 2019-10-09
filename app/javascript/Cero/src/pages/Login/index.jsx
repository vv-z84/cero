import React, { useState } from 'react'
import { Link, withRouter } from 'react-router-dom'
import axios from 'axios'
import { login } from '../../services'
import './styles.css'

const LoginPage = ({ history, ...props }) => {
    const [email, setEmail] = useState("")
    const [password, setPassword] = useState("")

    const handleSubmit = (event) => { 
        event.preventDefault()

        axios
            .post('/authenticate', { email, password })
            .then(response => { 
                if(response.status === 200) {
                    setEmail("")
                    setPassword("")
                    console.log(response)
                    login(response.data.auth_token) 
                    history.push('/app')
                }
            })
    }

    return (
        <form className="login-form" onSubmit={handleSubmit}>
            <p>Não tem uma conta? <Link to="/register">Registre-se :D</Link></p>
            <label className="login-form--label" htmlFor="user_mail">Email</label>
            <input className="login-form--input" type="text" id="user_mail" name="user_mail" onChange={e => setEmail(e.target.value)} />

            <label className="login-form--label" htmlFor="user_password">Password</label>
            <input className="login-form--input" type="password" id="user_password" name="user_password" onChange={e => setPassword(e.target.value)} />

            <button className="login-form--button" type="submit">Login!</button>
        </form>
    )
}

const LoginPageWithRouter = withRouter(LoginPage)
export { LoginPageWithRouter as LoginPage }