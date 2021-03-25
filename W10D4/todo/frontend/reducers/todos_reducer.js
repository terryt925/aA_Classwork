import {RECEIVE_TODOS} from '../actions/todo_actions';
import {RECEIVE_TODO} from '../actions/todo_actions';

const initialState = {
  1: {
    id: 1,
    title: "wash car",
    body: "with soap",
    done: false
  },
  2: {
    id: 2,
    title: "wash dog",
    body: "with shampoo",
    done: true
  }
};

const todosReducer = (state = initialState, action) => {
  Object.freeze(state);  
  const nextState = Object.assign({}, state);

  switch (action.type) {
    case RECEIVE_TODOS:
      const newObj = {};
      action.todos.forEach( (todo) => {
        newObj[todo.id] = todo;
      });
      return newObj;
    case RECEIVE_TODO:
      nextState[action.todo.id] = action.todo;
      // const item = nextState[action.todo.id];
      return nextState;
    default:
      return state;
  }
};

export default todosReducer;

// Still need to make singular todo reducer