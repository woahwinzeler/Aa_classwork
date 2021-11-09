import { RECEIVE_STEPS, RECEIVE_STEP, REMOVE_STEP, removeStep, recieveSteps, recieveStep } from '../actions/step_actions'

const stepsReducer = (state={}, action) => {
  Object.freeze(state);
  switch (action.type) {
    // case: 
  
    default:
      return state; 
  }
}
export default stepsReducer;