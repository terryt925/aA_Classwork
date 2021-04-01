export const selectAllPokemon = (state) => {
  return Object.values(state.entities.pokemon)
}
  

export const selectSinglePokemon = (state, ownProps) => {
  return Object.values(state.entities.pokemon[ownProps.match.params.id])
}

// [id: 1, name: bulbasaur, attack: 39, defense: 39]