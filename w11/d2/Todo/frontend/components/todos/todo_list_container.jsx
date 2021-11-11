import { connect } from 'react-redux'
import allTodos from '../../reducers/selectors'
import TodoList from './todo_list'
import {recieveTodo, removeTodo} from '../../actions/todo'

const mSTP = state => {
    return {
        todos: allTodos(state)
    }
}
const mDTP = (dispatch) => ({
    recieveTodo: (todo) => (dispatch(recieveTodo(todo))),
    removeTodo: (todo) => (dispatch(removeTodo(todo)))
})

export default connect(mSTP, mDTP)(TodoList)