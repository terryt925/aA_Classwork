import { connect } from 'react-redux';
import PokemonDetail from './pokemon_detail';
import { requestSinglePokemon } from './../../actions/pokemon_actions';
import { selectSinglePokemon } from './../../reducers/selectors';



const mapStateToProps = state => ({
  pokemon: selectSinglePokemon(state)
})

const mapDispatchToProps = dispatch => ({
  requestSinglePokemon: () => dispatch(requestSinglePokemon())
})

export default connect(mapStateToProps, mapDispatchToProps)(PokemonDetail)