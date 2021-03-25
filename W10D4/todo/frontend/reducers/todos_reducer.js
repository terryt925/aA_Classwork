import {RECEIVE_TODOS} from '../actions/todo_actions';

const todosReducer = (state = {}, action) => {
  Object.freeze(state);  
  const nextState = Object.assign({}, state);


  switch (action.type) {
    case RECEIVE_TODOS:
      return nextState[action.todos.id] = action.todos;
    default:
      return state;
  }
};

export default todosReducer;

// Still need to make singular todo reducer