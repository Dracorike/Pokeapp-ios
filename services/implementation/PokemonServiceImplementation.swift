//
//  PokemonServiceImplementation.swift
//  PokeApp
//
//  Created by Suprisul on 31/12/24.
//

import Foundation

class PokemonServiceImplementation: PokemonService {
    private var nextUrl: String? = nil
    private var previousUrl: String? = nil
    
    func fetchPokemonList() async -> [PokemonModel] {
        let pokemonListUrl = URL(string: "https://pokeapi.co/api/v2/pokemon")
        let request = URLRequest(url: pokemonListUrl!)
        var pokemonList: [PokemonModel] = []
        
        do {
            let (data, _) = try await URLSession.shared.data(for: request)
            guard let pokemons = try? JSONDecoder().decode(PokemonListEntity.self, from: data) else {
                print("Houve algum erro ao decodificar o JSON")
                return []
            }
            nextUrl = pokemons.next
            pokemonList.append(contentsOf: await transformDataInPokemons(pokemonEntityList: pokemons))
         }catch {
            print("Failed to request pokemon list.")
            print("error : \(error.localizedDescription)")
        }
        
        return pokemonList
    }
    
    
    func fetchNextPokemonList() async -> [PokemonModel] {
        if(nextUrl != nil) {
            let request = URLRequest(url: URL(string: nextUrl!)!)
            var pokemonList: [PokemonModel] = []
            
            do {
                let (data, _) = try await URLSession.shared.data(for: request)
                guard let pokemons = try? JSONDecoder().decode(PokemonListEntity.self, from: data) else {
                    print("Houve algum erro ao decodificar o JSON")
                    return []
                }
                
                nextUrl = pokemons.next
                previousUrl = pokemons.previous
                pokemonList.append(contentsOf: await transformDataInPokemons(pokemonEntityList: pokemons))
            } catch {
                print("Failed to request pokemon list.")
                print("error : \(error.localizedDescription)")
            }
            
            return pokemonList
        } else {
            return []
        }
    }
    
    private func transformDataInPokemons(pokemonEntityList:PokemonListEntity)  async -> [PokemonModel] {
        var pokemonList: [PokemonModel] = []
        for pokemon in pokemonEntityList.results {
            if let pokemonUrl = URL(string: pokemon.url!) {
                let pokemonRequest = URLRequest(url: pokemonUrl)
                do {
                    let (pokeData, _) = try await URLSession.shared.data(for: pokemonRequest)
                    let decoder = JSONDecoder()
                    decoder.keyDecodingStrategy = .convertFromSnakeCase
                    if let pokemonEntity = try? decoder.decode(PokemonEntity.self, from: pokeData) {
                        pokemonList.append(pokemonEntity.toPokemonModel())
                    }
                } catch {
                    print("Pokemon com url não válida: \(pokemonUrl)")
                }
            } else {
                print("Erro...")
            }
        }
        
        return pokemonList
    }
}
