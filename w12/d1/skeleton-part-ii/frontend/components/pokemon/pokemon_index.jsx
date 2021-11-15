import React, { useImperativeHandle } from 'react';
import PokemonIndexItem from './pokemon_index_item';


class PokemonIndex extends React.Component{
  constructor(props){
    super(props)
    
    this.handleClick = this.handleClick.bind(this);
  }
  
  componentDidMount(){
    this.props.requestAllPokemon()
  }

  handleClick(e){
    console.log("Getting hit")
    console.log(e); 
  }

  render(){
    //Add onClick handler to fetch a specific pokemon? 
    const pokemonItems = 
    this.props.pokemon.map(poke =>(
      <PokemonIndexItem key={poke.id}
      pokemon={poke} onClick={this.handleClick}/>
    )
    )
    return (
    <section className="pokedex">
      <ul>
        {
          pokemonItems
        }
      {/* {this.props.pokemon.map((poke) => (
        <li className="pokemon-index-item">
          <span>{poke.id}</span>
          <img src={poke.imageUrl}/>
          <span>{poke.name}</span>
        </li>
      ))} */}
      </ul>
    </section>
    )
  }
  }
  
  
  
  export default PokemonIndex;