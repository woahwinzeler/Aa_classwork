import { createStore, applyMiddleware } from "redux";
import thunkMiddleware from "../middleware/thunk";
import rootReducer from "../reducers/root_reducer";



function configureStore(preloadedState={}){
  return createStore(rootReducer, preloadedState, applyMiddleware(thunkMiddleware));
}

export default configureStore; 