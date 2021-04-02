import React, { Component } from "react";
import ReactDOM from "react-dom";
import { newUser, loginUser, logoutUser } from './util/session_api_util';
import configureStore from './store/store';
import Root from './component/root';


document.addEventListener("DOMContentLoaded", () => {

  const store = configureStore();
  window.loginUser = loginUser;
  window.logoutUser = logoutUser;
  window.newUser = newUser;
  window.getState = store.getState;
  window.dispatch = store.dispatch;

  const root = document.getElementById("root");
  ReactDOM.render(<Root store={store} />, root);
});
