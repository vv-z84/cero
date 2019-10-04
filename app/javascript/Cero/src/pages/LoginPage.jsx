import React, { useState } from 'react'
import { Link } from 'react-router-dom'
import axios from 'axios'

const LoginPage = () => {
    const initialState = {
        user: "",
        passowrd: ""
    }

    const [user, setUser] = useState(initialState)
    const [email, setEmail] = useState("")
    const [password, setPassword] = useState("")

    const handleSubmit = (event) => { 
        event.preventDefault();
        setUser({ user, email })

        axios
            .post('/authenticate', user)
            .then(response => { console.log(response) })

    }

    return (
        <form onSubmit={handleSubmit}>
            <label htmlFor="user_mail">Email</label>
            <input type="text" id="user_mail" name="user_mail" onChange={e => setEmail(e.target.value)} />

            <label htmlFor="user_password">Password</label>
            <input type="password" id="user_password" name="user_password" onChange={e => setPassword(e.target.value)} />

            <button type="submit">Login!</button>
        </form>
    )
}

export { LoginPage }