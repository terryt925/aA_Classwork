import React from 'react';

class TodoDetailView extends React.Component {
  constructor(props) {
    super(props);
  }

  render() {
    return (
      <div>
        <h1>{this.props.todo.body}</h1>
      </div>
    )
  }
}