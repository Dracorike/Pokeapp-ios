//
//  PokemonListScreen.swift
//  PokeApp
//
//  Created by Suprisul on 31/12/24.
//

import SwiftUI

struct PokemonListScreen : View{
    var pokemonList: [PokemonModel]
    var callMorePokemons: (PokemonModel) -> Void
    
    var body: some View {
        NavigationSplitView {
            List {
                ForEach(pokemonList) { pokemon in
                    NavigationLink {
                        PokemonInfoScreen(pokemonInfo: pokemon)
                    } label: {
                        PokemonCard(pokemon: pokemon)
                            .onAppear {
                                callMorePokemons(pokemon)
                            }
                    }
                }
                
                HStack {
                    Spacer()
                    Text("Loading...")
                    Spacer()
                }
            }
            .navigationTitle(Text("Pokemon List"))
        } detail: {
            Text("Select a Pokemon")
        }
    }
}

#Preview {
    PokemonListScreen(
        pokemonList: [
            PokemonModel.mock(),
            PokemonModel.mock(),
            PokemonModel.mock()
        ],
        callMorePokemons: { poke in }
    )
}
