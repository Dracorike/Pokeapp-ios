//
//  PokemonListEntity.swift
//  PokeApp
//
//  Created by Suprisul on 02/01/25.
//

struct PokemonListEntity : Hashable, Codable {
    var next:String?
    var previous:String?
    var results:[PokemonBitinfo]
    
    struct PokemonBitinfo : Hashable, Codable {
        let name:String?
        let url:String?
    }
}


