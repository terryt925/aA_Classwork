import { combineReducers } from 'redux';
import todosReducer from './todos_reducer';
import stepsReducer from './steps_reducer';
// import todoReducer from './todos_reducer';


const rootReducer = combineReducers({
  todos: todosReducer,
  steps: stepsReducer
  // todo: todosReducer
})

export default rootReducer;