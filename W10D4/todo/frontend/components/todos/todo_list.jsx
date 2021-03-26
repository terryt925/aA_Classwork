import React from 'react';

const TodoList = (props) => {
  return (
    <div>
      <h3>Todo List goes here!</h3>
      <ul>
        {props.todos.map( todo => <li key={todo.id}>Todo: {todo.title}</li>)}
      </ul>
    </div>
  )
}

export default TodoList;