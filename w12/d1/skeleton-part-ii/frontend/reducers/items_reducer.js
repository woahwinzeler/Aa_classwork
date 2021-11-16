import { RECEIVE_A_POKEMON } from "../actions/pokemon_actions";

const itemsReducer = (state = {}, action) =>{
  Object.freeze(state);

  switch (action.type) {
    case RECEIVE_A_POKEMON:
      return Object.assign({},action.items,state);
    default:
      return state;
  }
}

export default itemsReducer;