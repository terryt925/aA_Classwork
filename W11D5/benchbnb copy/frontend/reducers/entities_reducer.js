import { combineReducers } from 'redux';
import sessionReducer from './session_reducers'
import usersReducer from './users_reducer'

const entitiesReducer = combineReducers({
  users: usersReducer,
  //session: sessionReducer
});

export default entitiesReducer;