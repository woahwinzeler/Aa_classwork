import React from 'react'

class TodoForm extends React.Component {
    constructor(props){
        super(props);
        this.state = {
          id: 3,
          body: "",
          title: ""
        }
        this.updateBody = this.updateBody.bind(this);
        this.updateTitle = this.updateTitle.bind(this);
        this.handleSubmit = this.handleSubmit.bind(this);
        this.updateTodo = this.updateTodo.bind(this);
    }

    updateBody(e){
        this.setState({ body: e.target.value })
        console.log("state set")
    }

    updateTitle(e){
        this.setState({ title: e.target.value })
        console.log("state set")
    }

    //Not working 
    updateTodo(e){
        e.preventDefault();
        let todo = this.state;
        this.props.removetodo(todo);
        this.setState({ title: "", body: "", id: this.state.id + 1}) 
    }

    handleSubmit(e){
        e.preventDefault();
        let todo = this.state;
        // console.log(todo.id, "1");
        // console.log(this.props.recievetodo)
        // console.log(this.props.removetodo)
        this.props.recievetodo(todo);
        // console.log(todo.id, "2");
        this.setState({ title: "", body: "", id: this.state.id + 1}) 

        // this.setState({ title: "", body: "", id: ++this.state.id})
    }

    render(){
        return (
            <div>
            <h1>Create New ToDo</h1>
            <form onSubmit={this.handleSubmit}>
                <label htmlFor="title"> Title
                    <input 
                        name="title"
                        type="text"
                        value={this.state.title}
                        onChange={this.updateTitle}
                    />
                </label>
                <label htmlFor="body"> Body
                    <input 
                        name="body"
                        type="text"
                        value={this.state.body}
                        onChange={this.updateBody}
                    />
                </label>
                <input 
                type="submit"
                value= 'SUBMIT'
                />
            </form>
            </div>
        )
    }
}

export default TodoForm