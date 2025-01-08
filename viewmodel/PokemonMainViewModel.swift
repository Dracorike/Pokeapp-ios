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
    
    private let pokemonService:PokemonServiceImplementation = PokemonServiceImplementation()
    
    func callPokemonList() {
        Task {
            await MainActor.run {
                isLoading = true
            }
            let pokemonList = await pokemonService.fetchPokemonList()

            await MainActor.run {
                pokemons.append(contentsOf: pokemonList)
                isLoading = false
            }
        }
    }
    
    func callNextPokemonList() {
        Task {
            await MainActor.run {
                isLoading = true
            }
            let morePokemons = await pokemonService.fetchNextPokemonList()
            
            await MainActor.run {
                pokemons.append(contentsOf: morePokemons)
                isLoading = false
            }
        }
    }
    
    func canCallNextPokemonList(pokemon:PokemonModel) -> Bool {
        return pokemons.last?.id == pokemon.id && !isLoading
    }
}
