import { RECEIVE_TODOS, RECEIVE_TODO, DELETE_TODO, removeTodo, recieveTodos, recieveTodo } from '../actions/todo'
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
  let newState = Object.assign({}, state);
  switch (action.type) {
    case RECEIVE_TODOS:
     const returnState = Object.assign(newState, makeIdentity(action.todos));
     return returnState;
    case RECEIVE_TODO:
      
     newState[action.todo.id] = action.todo;
      return newState;
    case DELETE_TODO: 
      // console.log(action.todo)
      // console.log(todoId)
       
      delete newState[action.todoId]; 
      return newState; 
    default:
      return state; 
  }
}

export default todosReducer; 