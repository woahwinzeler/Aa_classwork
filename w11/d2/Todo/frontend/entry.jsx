import React from 'react'
import ReactDOM from 'react-dom'
import Root from './root'
import configureStore from './store/store'

document.addEventListener('DOMContentLoaded', () => {
  const root = document.getElementById('root');
  ReactDOM.render(<Root />, root);
  const store = configureStore(); 
  console.log(store);
  window.store = store; 
}); 