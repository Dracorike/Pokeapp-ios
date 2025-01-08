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
        PokemonListScreen(pokemonList: viewModel.pokemons).onAppear {
            viewModel.callPokemonList()
        }
    }
}

#Preview {
    ContentView(viewModel: PokemonMainViewModel())
}
