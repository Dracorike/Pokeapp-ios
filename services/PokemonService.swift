//
//  PokemonService.swift
//  PokeApp
//
//  Created by Suprisul on 31/12/24.
//

protocol PokemonService {
    func fetchPokemonList() async -> [PokemonModel]
    func fetchNextPokemonList() async -> [PokemonModel]
}
