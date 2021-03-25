import React from 'react';
import ReactDOM from 'react-dom';
import configureStore from './store/store';

import { receiveTodos } from './actions/todo_actions';
import { receiveTodo } from './actions/todo_actions';

document.addEventListener("DOMContentLoaded", () => {
  const root = document.getElementById("content");

  const testing = <h1>Todos App</h1>;

  const store = configureStore();
  window.store = store;

  window.receiveTodo = receiveTodo;
  window.receiveTodos = receiveTodos;

  ReactDOM.render(testing, root);
});


