//
//  PokemonListScreen.swift
//  PokeApp
//
//  Created by Suprisul on 31/12/24.
//

import SwiftUI

struct PokemonListScreen : View{
    var pokemonList: [PokemonModel]
    
    var body: some View {
        NavigationSplitView {
            List {
                ForEach(pokemonList) { pokemon in
                    NavigationLink {
                        PokemonInfoScreen(pokemonInfo: pokemon)
                    } label: {
                        PokemonCard(pokemon: pokemon)
                    }
                }
            }.navigationTitle(Text("Pokemon List"))
        } detail: {
            Text("Select a Pokemon")
        }
    }
}

#Preview {
    PokemonListScreen(pokemonList: [
        PokemonModel.mock(),
        PokemonModel.mock(),
        PokemonModel.mock()
    ])
}
