import React from 'react'
import ToDoListItem from './todo_list_item';
import TodoForm from './todo_form'
import {recieveTodo, removeTodo} from '../../actions/todo'
import array_combiner from '../../util/arraycombiner'

class TodoList extends React.Component {
  constructor(props){
    super(props); 
    this.updateTodo = this.updateTodo.bind(this);
  }

  updateTodo(e, index){
    console.log(e, index);
    const todos = this.props.todos; 
    e.preventDefault();
    let todo = todos[index];
    // store.dispatch(removeTodo(todo));
    this.props.removeTodo(todo); 
  }

  render(){
    console.log(recieveTodo); 
    const todos = this.props.todos; 
    const recieveTodo = this.props.recieveTodo; 
    const listItems = todos.map(todo => (<ToDoListItem key={todo.id} todo={todo}/>)); 
    const listButtons = todos.map((todo, i) => (<button value={this.state} onClick={(e) => (this.updateTodo(e, i))}>Remove Todo</button>)); 
    const listItemsWithButtons = array_combiner(listItems, listButtons)
    return(
      <div>
       {listItemsWithButtons}
        <TodoForm recievetodo={recieveTodo} removetodo={removeTodo}/>
      </div>
    )
  }
}

export default TodoList