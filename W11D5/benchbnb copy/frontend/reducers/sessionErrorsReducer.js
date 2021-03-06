import {RECEIVE_CURRENT_USER, RECEIVE_ERRORS} from '../actions/session_actions'

const _nullSession = {
  currentUser: null
};

const sessionErrorsReducer = (state = _nullSession, action) => {
  Object.freeze(state)
  switch (action.type) {
    case RECEIVE_ERRORS:
      return Object.assign({}, state, { errors: action.errors })
    case RECEIVE_CURRENT_USER:
      return Object.assign({}, state, { errors: '' })
    default:
      return state
  }
}

export default sessionErrorsReducer;