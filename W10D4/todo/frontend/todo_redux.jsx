import React from 'react';
import ReactDOM from 'react-dom';

import { receiveTodos } from './actions/todo_actions';
import { receiveTodo } from './actions/todo_actions';

document.addEventListener("DOMContentLoaded", () => {
  const root = document.getElementById("content");

  const testing = <h1>Todos App</h1>;

  ReactDOM.render(testing, root);
});
