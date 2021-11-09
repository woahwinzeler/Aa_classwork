import React from 'react'
import ReactDOM from 'react-dom'
import Root from './root'
import configureStore from './store/store'
import {  recieveTodos, recieveTodo, removeTodo } from './actions/todo'
import { receiveStep, receiveSteps, removeStep} from './actions/step_actions'

document.addEventListener('DOMContentLoaded', () => {
  const root = document.getElementById('root');
  ReactDOM.render(<Root />, root);
  const store = configureStore(); 
  console.log(store);
  window.store = store; 
  window.recieveTodos = recieveTodos;
  window.recieveTodo = recieveTodo;
  window.removeTodo = removeTodo; 
  window.recieveStep = receiveStep;
  window.removeStep = removeStep;
  window.recieveSteps = receiveSteps;
}); 