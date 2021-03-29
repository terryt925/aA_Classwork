import React from 'react';
import { uniqueId } from '../time_util';

class TodoForm extends React.Component {
  constructor(props) {
    super(props);

    this.state = {
      id: uniqueId(),
      title: '',
      body: '',
      done: false
    };

    this.updateTitle = this.updateTitle.bind(this);
    this.updateBody = this.updateBody.bind(this);
    this.updateDone = this.updateDone.bind(this);
    this.handleSubmit = this.handleSubmit.bind(this);
  }

  updateBody(e) {
    this.setState({body: e.target.value})
  }

  updateTitle(e) {
    this.setState({title: e.target.value})
  }
  
  updateDone(e) {
    this.setState({done: e.target.value})
  }

  handleSubmit(e) {
    e.preventDefault();
    this.props.receiveTodo(this.state);
    this.setState({
      id: uniqueId(),
      title: '',
      body: '',
      done: false
    })
  }

  render() {
    // const checked = () => {return (this.state.done === true ? "checked" : null);}

    return (
      <form onSubmit={this.handleSubmit}>
        <h1>Add Todo</h1>
        <label>Title:
          <input type="text" value={this.state.title} onChange={this.updateTitle}/>
        </label>

        <label>Body:
          <input type="text" value={this.state.body} onChange={this.updateBody}/>
        </label>

        <label>Done:
          <label>True
            <input type="radio" value="true" onChange={this.updateDone} checked={this.state.done}/>
          </label>

          <label>False
            <input type="radio" value="false" onChange={this.updateDone} checked={!this.state.done}/>
          </label>
        </label>

        <input type="submit" value="Add Todo"/>
      </form>
    )
  }

}

export default TodoForm;