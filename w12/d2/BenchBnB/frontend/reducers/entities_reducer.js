import { combineReducers } from "redux";
import usersReducer from "./user_reducer";

const entitiesReducer = combineReducers({
  users: usersReducer
})

export default entitiesReducer