//
//  PokemonEntity.swift
//  PokeApp
//
//  Created by Suprisul on 02/01/25.
//

struct PokemonEntity : Hashable, Codable, Identifiable{
    let id: Int
    let name: String
    let types: [TypePokemonHolder]
    let sprites: SpritesPokemon
    let stats: [StatsPokemonHolder]
    
    
    struct TypePokemonHolder: Hashable, Codable {
        let slot: Int
        let type: TypePokemon
        
        struct TypePokemon: Hashable, Codable {
            let name: String?
            let url: String?
        }
    }
    
    
    
    struct SpritesPokemon : Hashable, Codable {
        let frontDefault: String?
        let frontShiny: String?
        let backDefault: String?
        let backShiny: String?
    }
    
    struct StatsPokemonHolder : Hashable, Codable {
        let baseStat: Double
        let effort: Int
        
        struct StatsPokemon : Hashable, Codable {
            let name:String
        }
        
    }
}

extension PokemonEntity {
    func toPokemonModel() -> PokemonModel {
        let stats = PokeStatsModel(
            hp: self.stats[0].baseStat,
            attack: self.stats[1].baseStat,
            defense: self.stats[2].baseStat,
            spAttack: self.stats[3].baseStat,
            spDefense: self.stats[4].baseStat,
            speed: self.stats[5].baseStat
        )
        var types: [TypeChipModel] = []
        self.types.forEach {
            types.append($0.toTypeChipModel())
        }
        
        
        return PokemonModel(
            id: self.id,
            name: self.name,
            imageUrl: self.sprites.frontDefault ?? "",
            types: types,
            stats: stats
        )
    }
}


extension PokemonEntity.TypePokemonHolder {
    func toTypeChipModel() -> TypeChipModel {
        return TypeChipModel(name: self.type.name ?? "???", typePokemonColor: self.type.name?.toTypePokemonColor() ?? .unknown)
    }
}
