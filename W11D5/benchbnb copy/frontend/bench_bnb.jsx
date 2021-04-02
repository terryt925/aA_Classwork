import React from "react";
import ReactDOM from "react-dom";
import { newUser, loginUser, logoutUser } from './util/session_api_util';
import configureStore from './store/store';


document.addEventListener("DOMContentLoaded", () => {

  const store = configureStore();
  window.loginUser = loginUser;
  window.logoutUser = logoutUser;
  window.newUser = newUser;
  window.getState = store.getState;
  window.dispatch = store.dispatch;

  const root = document.getElementById("root");
  ReactDOM.render(<h1>Welcome to BenchBnB</h1>, root);
});
