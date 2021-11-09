import React from 'react'
import ReactDOM from 'react-dom'
import Root from './root'
import configureStore from './store/store'
import {  recieveTodos, recieveTodo } from './actions/todo'

document.addEventListener('DOMContentLoaded', () => {
  const root = document.getElementById('root');
  ReactDOM.render(<Root />, root);
  const store = configureStore(); 
  console.log(store);
  window.store = store; 
  window.recieveTodos = recieveTodos;
  window.recieveTodo = recieveTodo;
}); 