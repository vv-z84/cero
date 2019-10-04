import React from 'react'
import { Route, Switch } from 'react-router-dom'
import { LoginPage } from './pages'

const App = () => {
    return (
        <Switch>
            <Route exact path="/" component={LoginPage} />
        </Switch>
    )
}

export { App }