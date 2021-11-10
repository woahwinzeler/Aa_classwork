import React from 'react'
import ToDoListItem from './todo_list_item';
import TodoForm from './todo_form'
import recieveTodo from '../../actions/todo'

class TodoList extends React.Component {
  constructor(props){
    super(props); 
  }

  render(){
    const todos = this.props.todos; 
    const listItems = todos.map(todo => (<ToDoListItem key={todo.id} todo={todo}/>)); 
    return(
      <div recieveTodo={recieveTodo}>
        {listItems}
        <TodoForm />
      </div>
    )
  }
}

export default TodoList