import React from 'react';
import ReactDOM from 'react-dom';
import configureStore from './store/store';

import { receiveTodos } from './actions/todo_actions';
import { receiveTodo } from './actions/todo_actions';
import { removeTodo } from './actions/todo_actions';
import { fetchAllTodos } from './actions/todo_actions';


import { receiveSteps } from './actions/step_actions';
import { receiveStep } from './actions/step_actions';
import { removeStep } from './actions/step_actions';

import Root from './components/root';
import { allTodos } from './reducers/selectors';


document.addEventListener("DOMContentLoaded", () => {
  const root = document.getElementById("root");

  const testing = <h1>Todos App</h1>;

  const state = { todos: { id: 1, title: "clean dog" } };

  const store = configureStore();
  window.store = store;

  window.fetchAllTodos = fetchAllTodos;

  window.receiveTodo = receiveTodo;
  window.receiveTodos = receiveTodos;
  window.removeTodo = removeTodo;

  window.receiveStep = receiveStep;
  window.receiveSteps = receiveSteps;
  window.removeStep = removeStep;
  window.allTodos = allTodos;


  ReactDOM.render(<Root store = {store}/>, root);
});


