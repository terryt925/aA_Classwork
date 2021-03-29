import { connect } from 'react-redux';
import TodoList from './todo_list';
import { receiveTodo } from '../../actions/todo_actions';
import { removeTodo } from '../../actions/todo_actions';

import { allTodos } from '../../reducers/selectors';


const mapStateToProps = (state) => {
  return ({
    todos: allTodos(state)
  });
}

const mapDispatchToProps = dispatch => ({
  receiveTodo: todo => dispatch(receiveTodo(todo)),
  removeTodo: todo => dispatch(removeTodo(todo))
});

export default connect(
  mapStateToProps,
  mapDispatchToProps
)(TodoList);