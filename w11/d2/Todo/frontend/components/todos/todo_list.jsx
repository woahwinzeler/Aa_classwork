import React from 'react'
import ToDoListItem from './todo_list_item';
import TodoForm from './todo_form'
import {recieveTodo} from '../../actions/todo'

class TodoList extends React.Component {
  constructor(props){
    super(props); 
  }

  render(){
    console.log(recieveTodo); 
    const todos = this.props.todos; 
    const recieveTodo = this.props.recieveTodo; 
    const listItems = todos.map(todo => (<ToDoListItem key={todo.id} todo={todo}/>)); 
    return(
      <div>
        {listItems}
        <TodoForm recievetodo={recieveTodo}/>
      </div>
    )
  }
}

export default TodoList