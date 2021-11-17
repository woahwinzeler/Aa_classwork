import React from "react"
import ReactDOM from 'react-dom'
import Root from './components/root'
import configureStore from './store/store'

document.addEventListener("DOMContentLoaded", () =>{
  const root = document.getElementById('root')
  
  
  //For Testing 
  const store = configureStore();
  
  window.getState = store.getState;
  window.dispatch = store.dispatch; 
  window.store = store
  ReactDOM.render(<Root store={store} />, root);
})