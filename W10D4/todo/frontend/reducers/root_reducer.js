import { combinedReducers } from 'redux';
import todosReducer from './todos_reducer';

const rootReducer = combinedReducers({
  todos: todosReducer
  // might be back for todo: todoReducer  
})

export default rootReducer;