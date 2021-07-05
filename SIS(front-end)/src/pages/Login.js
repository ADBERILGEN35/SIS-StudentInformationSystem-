import React, {Component} from "react";
import {Redirect} from "react-router-dom";
import {isLogin, login} from "../utils";
import {AuthService} from "../api/auth";

export class Login extends Component {
    constructor(props) {
        super(props);
        this.state = {
            usrename: "",
            password: ""
        }
    }

    render() {
        return (
            <div className="section is-fullheight">
                {isLogin() && <Redirect to="/default"/>}
                <div className="container">
                    <div className="column is-6 is-offset-3">
                        <div className="box">
                            <h1>Login</h1>
                            <form onSubmit={this.loginHandler}>
                                <div className="field">
                                    <label className="label">username</label>
                                    <div className="control">
                                        <input
                                            autoComplete="off"
                                            className={`input`}
                                            name="username"
                                            onChange={this.usernameChangeHandler}
                                            value={this.state.username || ""}
                                            required
                                        />
                                    </div>
                                </div>
                                <div className="field">
                                    <label className="label">Password</label>
                                    <div className="control">
                                        <input
                                            className={`input`}
                                            type="password"
                                            name="password"
                                            onChange={this.passwordChangeHandler}
                                            value={this.state.password || ""}
                                            required
                                        />
                                    </div>
                                </div>
                                <button
                                    type="submit"
                                    className="button is-block is-info is-fullwidth"
                                >
                                    Login
                                </button>
                            </form>
                        </div>
                    </div>
                </div>
            </div>
        );

    }

    usernameChangeHandler = (e) => {
        this.setState({username: e.target.value})
    }

    passwordChangeHandler = (e) => {
        this.setState({password: e.target.value})
    }

    loginHandler = async () => {
        const payload = {
            username: this.state.username,
            password: this.state.password
        }

        const result = await AuthService.login(payload);
        if (result.data) {
            login(result.data.token);
            return <Redirect to="/dashboard"/>;
        } else {
            console.log("error")
        }
    }

}

export default Login;
