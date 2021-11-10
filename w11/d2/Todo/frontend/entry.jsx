import React from 'react'
import ReactDOM from 'react-dom'
import configureStore from './store/store'
import {  recieveTodos, recieveTodo, removeTodo } from './actions/todo'
import { receiveStep, receiveSteps, removeStep} from './actions/step_actions'
import App from './components/app'
import Root from './components/root'
import allTodos from './reducers/selectors'

document.addEventListener('DOMContentLoaded', () => {
  const root = document.getElementById('main');
  const store = configureStore(); 
  // console.log(store); 
  ReactDOM.render(<Root store={store}/>, root);
  // console.log(store);
  window.store = store; 
  window.allTodos = allTodos;
  window.recieveTodos = recieveTodos;
  window.recieveTodo = recieveTodo;
  window.removeTodo = removeTodo; 
  window.receiveStep = receiveStep;
  window.removeStep = removeStep;
  window.receiveSteps = receiveSteps;
}); 