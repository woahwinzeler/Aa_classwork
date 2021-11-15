import React from 'react'
import { Link } from 'react-router-dom';


const PokemonIndexItem = (props) => {
  
  return (
    <li>
      <Link to={`/pokemon/${props.pokemon.id}`}> {props.pokemon.name} </Link>
        <img className="img" src={props.pokemon.imageUrl} />
    </li>
  )
}

export default PokemonIndexItem;