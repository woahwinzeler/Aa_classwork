import React from 'react'
import TodoList from './todos/todo_list_container'

class App extends React.Component {
  constructor(props){
    super(props)
  }
  render(){
    const store = this.props.store
  return (
    <TodoList store={store}>
    <h1> ToDos App </h1>
    </TodoList>
    )
  }
}

export default App; 