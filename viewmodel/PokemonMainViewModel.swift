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
            let pokemonList = await pokemonService.fetchPokemonList()
            pokemonList.forEach { print($0.types.first) }
            await MainActor.run {
                pokemons.append(contentsOf: pokemonList)
            }
        }
    }
}
