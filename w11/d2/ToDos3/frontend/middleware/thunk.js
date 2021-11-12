
const thunkMiddleware = ({ dispatch, getState }) => next => action => {
    if (typeof action === "function"){
        return action(dispatch, getState)
    } else {
        return next(action)
    }
}

export default thunkMiddleware