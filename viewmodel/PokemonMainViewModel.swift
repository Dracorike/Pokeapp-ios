//
//  PokemonMainViewModel.swift
//  PokeApp
//
//  Created by Suprisul on 31/12/24.
//
import Foundation

class PokemonMainViewModel : ObservableObject{
    @Published var pokemons : [PokemonModel] = []
    @Published var isLoading : Bool = false
    var nextListInProgress: Bool = false
    
    private let pokemonService:PokemonServiceImplementation = PokemonServiceImplementation()
    
    func callPokemonList() {
        Task {
            nextListInProgress = true
            let pokemonList = await pokemonService.fetchPokemonList()

            await MainActor.run {
                pokemons.append(contentsOf: pokemonList)
            }
            nextListInProgress = false
        }
    }
    
    func callNextPokemonList() {
        Task {
            nextListInProgress = true
            let morePokemons = await pokemonService.fetchNextPokemonList()
            print("Next")
            
            await MainActor.run {
                pokemons.append(contentsOf: morePokemons)
            }
            nextListInProgress = false
        }
    }
    
    func canCallNextPokemonList(pokemon:PokemonModel) -> Bool {
        return pokemons.last?.id == pokemon.id && nextListInProgress == false
    }
}
