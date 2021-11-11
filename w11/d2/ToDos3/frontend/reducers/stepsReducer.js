import { RECEIVE_STEPS, RECEIVE_STEP, REMOVE_STEP, removeStep, receiveSteps, receiveStep } from '../actions/step_actions'
import makeIdentity from '../util/identify'


const stepsReducer = (state={}, action) => {
  Object.freeze(state);
  let newState = Object.assign({}, state);
  switch (action.type) {
     case RECEIVE_STEPS:
      return Object.assign(newState, makeIdentity(action.steps));
     case RECEIVE_STEP:
      const newReturnState = Object.assign({}, state);
      newReturnState[action.step.id] = action.step;
      return newReturnState;
     case REMOVE_STEP:
      delete newState[action.step.id];
      return newState;
    default:
      return state; 
  }
}

export default stepsReducer;