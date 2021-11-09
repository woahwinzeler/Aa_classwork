export const RECEIVE_TODOS = "RECEIVE_TODOS";
export const RECEIVE_TODO = "RECEIVE_TODO";

//Plural
export const recieveTodos = todos => {
  return {type: RECEIVE_TODOS, todos} 
}; 

//Singular 
export const recieveTodo = todo => {
  return {type: RECEIVE_TODO, todo} 
}; 

