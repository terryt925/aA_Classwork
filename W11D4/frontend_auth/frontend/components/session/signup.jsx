import React from 'react';

class Signup extends React.Component {
  constructor(props) {
    super(props);
    this.state = {
      username: '',
      emial: '',
      password: ''
    }
    this.handleSubmit = this.handleSubmit.bind(this)
  }

  handleInupt(type) {
    return (e) => {
      this.setState({ [type]:e.target.value })
    }
  }

  handleSubmit(e) {
    e.preventDefault();
    this.props.createNewUser(this.state)
      .then( () => this.props.history.push('/chirps'));
  }

  render () {
    return (
      <div className="session-form">
        <h1>Sign Up!</h1>
        <form>
          <label>Username:
            <input type="text" value={this.state.username} onChange={this.handleInupt('username')}/>
          </label>
          <label>Email:
            <input type="text" value={this.state.email} onChange={this.handleInupt('email')} />
          </label>
          <label>Password:
            <input type="password" value={this.state.password} onChange={this.handleInupt('password')} />
          </label>
          <button onClick={this.handleSubmit}>Sign Up</button>
        </form>
      </div>
    )
  }
}

export default Signup;