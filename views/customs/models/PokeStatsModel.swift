//
//  PokeStatsModel.swift
//  PokeApp
//
//  Created by Suprisul on 31/12/24.
//
import SwiftUI

struct PokeStatsModel {
    let hp:Double
    let attack:Double
    let defense:Double
    let spAttack:Double
    let spDefense:Double
    let speed:Double
    
    static func mock() -> PokeStatsModel {
        PokeStatsModel(hp: 100, attack: 100, defense: 100, spAttack: 100, spDefense: 100, speed: 100)
    }
}
