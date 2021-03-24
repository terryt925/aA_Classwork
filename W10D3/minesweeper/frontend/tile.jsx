import React from 'react';

class Tile extends React.Component {
  constructor(props) {
    super(props);
    this.handleClick = this.handleClick.bind(this);
  }

  handleClick(e) {
    e.preventDefault();
    let flagged = false;
    if(e.altKey) {
      flagged = true;
    }
    this.props.updateGame(this.props.tile, flagged);
  }

  render() {
    return (
      <div className='tile' onClick={this.handleClick}>
        T
      </div>
    )
  }
}

export default Tile;