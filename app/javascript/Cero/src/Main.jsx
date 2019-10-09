import React from 'react'
import { BrowserRouter, Route, Switch, Redirect } from 'react-router-dom'
import { AppPage, LoginPage, RegisterPage } from './pages'
import { isAuthenticated } from './services'
import "./Main.css"

const PrivateRoute = ({ component: Component, ...rest }) => {
    const render = props => isAuthenticated() ? (<Component {...props} />) : (<Redirect to={{ pathname: "/", state: { from: props.location }}} />)
    return (<Route {...rest} render={render} />)
}

const Main = () => {
    return (
        <BrowserRouter>
            <Switch>
                <Route exact path="/" component={LoginPage} />
                <Route path="/register" component={RegisterPage} />
                <PrivateRoute path="/app" component={AppPage} />
                <Route path="*" component={() => <h1>Not found</h1>} />
            </Switch>
        </BrowserRouter>
    )
}

export { Main }