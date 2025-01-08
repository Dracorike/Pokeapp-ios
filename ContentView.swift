//
//  ContentView.swift
//  PokeApp
//
//  Created by Suprisul on 17/12/24.
//

import SwiftUI

struct ContentView: View {
    @ObservedObject var viewModel: PokemonMainViewModel
    
    var body: some View {
        PokemonListScreen(
            pokemonList: viewModel.pokemons,
            callMorePokemons: { pokemon in
                if viewModel.canCallNextPokemonList(pokemon: pokemon) {
                    viewModel.callNextPokemonList()
                }
            }
        ).onAppear {
            viewModel.callPokemonList()
        }
    }
}

#Preview {
    ContentView(viewModel: PokemonMainViewModel())
}
