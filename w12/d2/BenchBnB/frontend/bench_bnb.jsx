import React from "react"
import ReactDOM from 'react-dom'
import {login, logout, signup} from './util/session_api_util'
import configureStore from './store/store'

document.addEventListener("DOMContentLoaded", () =>{
  const root = document.getElementById('root')
  ReactDOM.render(<h1> Bench Bnb </h1>, root);


  //For Testing 
  window.login = login;
  window.logout = logout;
  window.signup = signup; 
  const store = configureStore();

  window.getState = store.getState;
  window.dispatch = store.dispatch; 
})