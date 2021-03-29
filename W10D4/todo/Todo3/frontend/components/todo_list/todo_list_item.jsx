import React from 'react';
// import TodoDetails

class TodoListItem extends React.Component {
  constructor(props) {
    super(props);
    this.state = {
      id: this.props.todo.id,
      title: this.props.todo.title,
      body: this.props.todo.body,
      done: this.props.todo.done
    }

    this.handleRemove = this.handleRemove.bind(this);
    this.handleSwitch = this.handleSwitch.bind(this);
  }

  handleRemove(e) {
    e.preventDefault();
    this.props.removeTodo(this.state);
  }

  handleSwitch(e) {
    e.preventDefault();
    this.state.done = !this.state.done;
    this.props.receiveTodo(this.state);
  }

  render() {
    const buttonStat = this.state.done ? "Undo" : "Done";

    return (
      <li>
        <span>{this.state.title}</span>
        <span>
          <button onClick={this.handleRemove}>Remove Todo</button>
        </span>
        <span>
          <button onClick={this.handleSwitch}>{buttonStat}</button>
        </span>
        {/* <p><TodoDetailView todo={this.todo}/></p>  */}
        {/* Add some kind of toggle */}
      </li>
      // only one li here, React doesn't need key

    )
  }
}

export default TodoListItem;