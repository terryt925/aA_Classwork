import { loginUser, logoutUser, newUser } from '../util/session_api_util';

export const RECEIVE_CURRENT_USER = "RECEIVE_CURRENT_USER";
export const LOGOUT_CURRENT_USER = "LOGOUT_CURRENT_USER";
export const RECEIVE_ERRORS = "RECEIVE_ERRORS";


// action creators

const receiveCurrentUser = user => ({
  type: RECEIVE_CURRENT_USER,
  user
});

const logoutCurrentUser = () => ({
  type: LOGOUT_CURRENT_USER
});

export const receiveErrors = (errors) => ({
  type: RECEIVE_ERRORS,
  errors
});


//thunk action creators


export const signup = formUser => (dispatch) => newUser(formUser)
  .then(user => dispatch(receiveCurrentUser(user)));

export const login = formUser => (dispatch) => loginUser(formUser)
  .then(user => dispatch(receiveCurrentUser(user)));

export const logout = () => (dispatch) => logoutUser()
  .then(() => dispatch(logoutCurrentUser()));