import entitiesReducer from './entities_reducer';
import sessionReducer from './session_reducers';
import errosReducer from './errorsReducer';
import {combineReducers} from 'redux';

const rootReducer = combineReducers({
  entities: entitiesReducer,
  session: sessionReducer,
  errors: errosReducer
})

export default rootReducer;