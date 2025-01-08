//
//  PokemonCard.swift
//  PokeApp
//
//  Created by Suprisul on 31/12/24.
//

import SwiftUI

struct PokemonCard: View {
    let pokemon: PokemonModel
    var body: some View {
        HStack {
            AsyncImage(url: URL(string: pokemon.imageUrl)) { image in
                image
                    .frame(width: 50, height: 50)
                    .fixedSize()
            } placeholder: {
                ProgressView()
            }
            Text(pokemon.name)
            Spacer()
            VStack {
                TypeChip(chipInfo: pokemon.types.first!)
                if pokemon.types.count > 1 {
                    TypeChip(chipInfo: PokemonModel.mock().types.last!)
                } else {
                    Spacer().frame(height: 35)
                }
            }
        }
    }
}

#Preview {
    PokemonCard(pokemon: PokemonModel.mock())
}
