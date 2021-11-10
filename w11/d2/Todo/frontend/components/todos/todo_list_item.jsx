import React from 'react'

class ToDoListItem extends React.Component {
  constructor(props){
    super(props);
  }

  render(){
    console.log(this.props.todo)
    const title = this.props.todo.title; 
    return (
      <li> {title} </li>
    )
  }
}

export default ToDoListItem; 