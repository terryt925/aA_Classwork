import React from 'react';
import Board from './board'
import * as Minesweeper from '../minesweeper'

class Game extends React.Component {
  constructor(props) {
    super(props);
    const board = new Minesweeper.Board(20, 10);
    this.state = {
      board: board
    };
    this.updateGame = this.updateGame.bind(this);
  }

  updateGame(tileObject, flagged) {
    if(flagged) {
      tileObject.toggleFlag();
    } else {
      tileObject.explore();
    }
    this.setState({ board: this.state.board })
  }

  render() {
    if(this.state.board.won()) {
      return(
        <div>
          <div>You Win</div>
          <Board board={this.state.board} updateGame={this.updateGame} />
        </div>
      )
    } else if(this.state.board.lose()) {
      return(
        <div>
          <div>You Lose</div>
          <Board board={this.state.board} updateGame={this.updateGame} />
        </div>
      )
    }
    return (
      <div>
        <Board board={this.state.board} updateGame={this.updateGame}/>
      </div>
    )
  }
}

export default Game;