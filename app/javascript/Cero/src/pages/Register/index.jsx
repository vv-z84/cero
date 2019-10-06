import React, { useState } from 'react'
import { Link, withRouter } from 'react-router-dom'
import { client } from '../../services'
import './styles.css'

const RegisterPage = ({ history, ...props}) => {
    const [email, setEmail] = useState("")
    const [password, setPassword] = useState("")

    const handleRegister = (event) => {
        event.preventDefault()
        client.post('/register', { email, password })
            .then(response => {
                if(response.status === 201)
                    history.push('/')
            })
    }

    return (
        <form className="register-form" onSubmit={handleRegister}>
            <p>Tem registro? <Link to="/">Loga ae :D</Link></p>
            <label className="register-form--label" htmlFor="user_email">Email</label>
            <input className="register-form--input" type="text" name="user_email" id="user_email" onChange={e => setEmail(e.target.value)}/>
            <label className="register-form--label" htmlFor="user_password">Password</label>
            <input className="register-form--input" type="password" name="user_password" id="user_password" onChange={e => setPassword(e.target.value)} />

            <button className="register-form--button" type="submit">Enviar</button>
        </form>
    )
}

const RegisterPageWithRouter = withRouter(RegisterPage)
export { RegisterPageWithRouter as RegisterPage } 