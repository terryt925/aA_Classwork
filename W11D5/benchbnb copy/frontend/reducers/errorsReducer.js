import {combineReducers} from 'redux';
import sessionErrorsReducer from './sessionErrorsReducer';

const errosReducer = combineReducers({
  session: sessionErrorsReducer
})

export default errosReducer;