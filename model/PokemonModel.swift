//
//  PokemonModel.swift
//  PokeApp
//
//  Created by Suprisul on 30/12/24.
//

class PokemonModel : Identifiable {
    var id:Int
    var name: String
    var imageUrl: String
    var types: [TypeChipModel]
    var stats: PokeStatsModel
    
    init(id: Int, name: String, imageUrl: String, types: [TypeChipModel], stats:PokeStatsModel) {
        self.id = id
        self.name = name
        self.imageUrl = imageUrl
        self.types = types
        self.stats = stats
    }
    
    static func mock() -> PokemonModel {
        PokemonModel(
            id: 1,
            name: "Pikachu",
            imageUrl: "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/25.png",
            types: [
                TypeChipModel(name: "Eletrico", color: .yellow),
                TypeChipModel(name: "Comum", color: .brown)
            ],
            stats: PokeStatsModel.mock()
        )
    }
}
