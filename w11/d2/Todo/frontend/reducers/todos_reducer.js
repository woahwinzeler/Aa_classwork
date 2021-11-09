import React from 'react'
import { RECEIVE_TODOS, RECEIVE_TODO, recieveTodos, recieveTodo } from '../actions/todo'
import makeIdentity from '../util/identify'

const initialState = {
  1: {
    id: 1,
    title: "wash car",
    body: "with soap",
    done: false
  },
  2: {
    id: 2,
    title: "wash dog",
    body: "with shampoo",
    done: true
  }
};


const todosReducer = (state=initialState, action) => {
  Object.freeze(state);
  let newState;
  switch (action.type) {
    case RECEIVE_TODOS:
     const returnState = Object.assign(makeIdentity(action.todos), {});
     return returnState;
    case RECEIVE_TODO:
      const newReturnState = Object.assign(action.todo, state);
      return newReturnState;
    default:
      return state; 
  }
}

export default todosReducer; 