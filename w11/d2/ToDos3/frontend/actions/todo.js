import * as ToDoApiUtil from '../util/todo_api_util'


export const RECEIVE_TODOS = "RECEIVE_TODOS";
export const RECEIVE_TODO = "RECEIVE_TODO";
export const DELETE_TODO = "DELETE_TODO";

//Plural
export const recieveTodos = todos => {
  return {type: RECEIVE_TODOS, todos} 
}; 

//Singular 
export const recieveTodo = todo => {
  return {type: RECEIVE_TODO, todo} 
}; 

export const removeTodo = todoId => {
  return {type: DELETE_TODO, todoId}
};

export const fetchToDos = () => dispatch => {
  return (ToDoApiUtil.fetchTodos().then(todos => dispatch(recieveTodos(todos))))
}