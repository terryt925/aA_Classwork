import React from 'react';
import Tile from './tile.jsx';


class Board extends React.Component {
  constructor(props) {
    super(props)
  }
  render() {
    const rows = this.props.board.grid.map((row, idx) => {
      return <div key={`${idx}`}>
        {row.map((tile, idx2) => {
          return (<Tile key={idx2} />)
        })}
      </div>
    })
    return (
      <div>
        {rows}
      </div>
    )
  }
  
}

export default Board;

