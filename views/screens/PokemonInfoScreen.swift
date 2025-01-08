//
//  PokemonInfoScreen.swift
//  PokeApp
//
//  Created by Suprisul on 31/12/24.
//

import SwiftUI

struct PokemonInfoScreen : View {
    let pokemonInfo:PokemonModel
    
    var body: some View {
        VStack {
            AsyncImage(url: URL(string: pokemonInfo.imageUrl)) { image in
                image
                    .resizable()
                    .frame(width: 300, height: 300)
                    .clipShape(Circle())
                    .overlay {
                        Circle().stroke(.black, lineWidth: 5)
                    }
                    .background {
                        EmptyView().frame(height: 5).background(.black)
                    }
            } placeholder: {
                ProgressView()
            }
            Divider().padding(.vertical, 20)
            Text(pokemonInfo.name)
                .font(.title2)
            HStack {
                ForEach(pokemonInfo.types){ type in
                    TypeChip(chipInfo: type)
                }
            }
            PokeStatsView(stats: pokemonInfo.stats)
            Spacer()
        }.padding(.horizontal)
    }
}

#Preview {
    PokemonInfoScreen(pokemonInfo: PokemonModel.mock())
}
