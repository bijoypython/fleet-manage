import React, { useState, useEffect } from 'react';
import axios from 'axios';
import { useNavigate } from 'react-router-dom';

const Login = () => {
    const [vehicle_id, setvehicle_id] = useState('');
    const [trans_date, settrans_date] = useState('');
    const [amount, setamount] = useState('');
    const [remarks, setremarks] = useState('');
    const [type, settype] = useState('');

    const [error, seterror] = useState('Sign in to start your session');
    const navigate = useNavigate();

    const login = () => {
        axios.post('http://localhost/fleet_manage/backend/Login', {
            email: mail,
            password: pass
        }, {
            headers: {
                'Content-Type': 'application/json'
            }
        }).then(function (response) {
            let data = response.data;

            if (data.status == true) {
                localStorage.setItem('token', data.token)
                navigate("/dashboard");
            } else {
                seterror('Something went wrong!')
            }
        })
    }
    useEffect(() => {
        let token = localStorage.getItem('token')
        if (token != null) {
            navigate("/dashboard");
        }
    }, []);
    
    return (
        <>
            <div className='hold-transition login-page'>
                <div className="login-box">
                    <div className="login-logo">
                        <a href="#"><b>Admin</b>Panel</a>
                    </div>
                    <div className="card">
                        <div className="card-body login-card-body">
                            <p className="login-box-msg">{error}</p>
                            <div className="input-group mb-3">
                                <input type="number" className="form-control" placeholder="Email" onChange={(e) => setvehicle_id(e.target.value)} />
                                <div className="input-group-append">
                                    <div className="input-group-text">
                                        <span className="fas fa-envelope"></span>
                                    </div>
                                </div>
                            </div>

                            <div className="input-group mb-3">
                                <input type="date" className="form-control" placeholder="Password" onChange={(e) => settrans_date(e.target.value)} />
                                <div className="input-group-append">
                                    <div className="input-group-text">
                                        <span className="fas fa-lock"></span>
                                    </div>
                                </div>
                            </div>

                            <div className="input-group mb-3">
                                <input type="number" className="form-control" placeholder="Password" onChange={(e) => setamount(e.target.value)} />
                                <div className="input-group-append">
                                    <div className="input-group-text">
                                        <span className="fas fa-lock"></span>
                                    </div>
                                </div>
                            </div>



                            <div className="row">
                                <div className="col-8">
                                    <div className="input-group mb-3">
                                        <input type="number" className="form-control" placeholder="Password" onChange={(e) => setremarks(e.target.value)} />
                                        <div className="input-group-append">
                                            <div className="input-group-text">
                                                <span className="fas fa-lock"></span>
                                            </div>
                                        </div>
                                    </div>

                                    <div className="input-group mb-3">
                                        <input type="number" className="form-control" placeholder="Password" onChange={(e) => settype(e.target.value)} />
                                        <div className="input-group-append">
                                            <div className="input-group-text">
                                                <span className="fas fa-lock"></span>
                                            </div>
                                        </div>
                                    </div>
                                    <div className="icheck-primary">

                                    </div>
                                </div>
                                <div className="col-4">
                                    <button type="submit" className="btn btn-primary btn-block" onClick={login}>Sign In</button>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </>
    );
}

export default Login;
