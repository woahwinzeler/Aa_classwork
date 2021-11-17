import { login, logout, signup } from "../util/session_api_util"

export const RECEIVE_CURRENT_USER = "RECEIVE_CURRENT_USER"
export const LOGOUT_CURRENT_USER = "LOGOUT_CURRENT_USER"
export const RECEIVE_ERRORS = "RECEIVE_ERRORS"

//Three thunk

export const loginUser = (formUser) => dispatch => login(formUser)
.then(user => dispatch(receiveCurrentUser(user)))

export const logoutUser = () => dispatch => logout()
.then(() => dispatch(logoutCurrentUser()))

export const signupUser = (formUser) => dispatch => signup(formUser)
.then((user) => dispatch(receiveCurrentUser(user)))



export const receiveCurrentUser = (user) => ({
  type: RECEIVE_CURRENT_USER, 
  user 
})

export const logoutCurrentUser = () => ({
  type: LOGOUT_CURRENT_USER
})

export const receiveErrors = (error) => ({
  type: RECEIVE_ERRORS,
  error
})

