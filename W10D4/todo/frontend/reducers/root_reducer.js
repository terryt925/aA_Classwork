import { combineReducers } from 'redux';
import todosReducer from './todos_reducer';

const rootReducer = combineReducers({
  todos: todosReducer
  // might be back for todo: todoReducer  
})

export default rootReducer;