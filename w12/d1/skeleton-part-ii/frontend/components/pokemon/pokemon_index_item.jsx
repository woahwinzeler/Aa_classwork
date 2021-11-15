import React from 'react'

const PokemonIndexItem = (props) => {
  
  return (
    <li>
      <img className="img" src={props.pokemon.imageUrl} />
      {props.pokemon.name}
    </li>
  )
}

export default PokemonIndexItem;