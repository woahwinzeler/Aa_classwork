import React from 'react'
import ToDoListItem from './todo_list_item';

class TodoList extends React.Component {
  constructor(props){
    super(props); 
  }

  render(){
    const todos = this.props.todos; 
    const listItems = todos.map(todo => (<ToDoListItem key={todo.id} todo={todo}/>)); 
    return(
      <div>
        {listItems}
      </div>
    )
  }
}

export default TodoList