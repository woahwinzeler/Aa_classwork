import { connect } from 'react-redux'
import allTodos from '../../reducers/selectors'
import TodoList from './todo_list'
import recieveTodo from '../../actions/todo'

const mSTP = ({ store }) => {
    return {
        todos: allTodos(store.todos)
    }
}
const mDTP = (dispatch) => ({
    recieveTodo: (todo) => (dispatch(recieveTodo(todo))) 
})

export default connect(mSTP, mDTP)(TodoList)