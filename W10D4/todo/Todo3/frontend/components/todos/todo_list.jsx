import React from 'react';
import TodoListItem from '../todo_list/todo_list_item';
import TodoForm from '../todo_list/todo_form';

const TodoList = (props) => {
  return (
    <div>
      <h3>Todo List goes here!</h3>
      <ul>
        {props.todos.map( todo => <TodoListItem key={todo.id} todo={todo} removeTodo={props.removeTodo} receiveTodo={props.receiveTodo}/>)}
        {/* Key is for where the list things are;
        here the list things are the list item COMPONENTS (not the li) */}
      </ul>

      <TodoForm receiveTodo={props.receiveTodo}/>
    </div>
  )
}

export default TodoList;