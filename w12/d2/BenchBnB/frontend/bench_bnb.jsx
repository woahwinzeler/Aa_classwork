import React from "react"
import ReactDOM from 'react-dom'
import {login, logout, signup} from './util/session_api_util'

document.addEventListener("DOMContentLoaded", () =>{
  const root = document.getElementById('root')
  ReactDOM.render(<h1> Bench Bnb </h1>, root);

  //For Testing 
  window.login = login;
  window.logout = logout;
  window.signup = signup; 

})