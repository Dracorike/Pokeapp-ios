//
//  TypeChipModel.swift
//  PokeApp
//
//  Created by Suprisul on 30/12/24.
//
import SwiftUI

struct TypeChipModel : Identifiable{
    var id: String
    let name: String
    var color: Color = .green
    private var typePokemonColor: TypePokemonColor? = nil
    
    init(name: String, color: Color) {
        self.name = name
        self.color = color
        self.id = name
    }
    
    init(name:String, typePokemonColor:TypePokemonColor){
        self.name = name
        self.typePokemonColor = typePokemonColor
        self.id = name
        self.color = typePokemonColorToColor(typePokemonColor: typePokemonColor)
    }
    
    private func typePokemonColorToColor(typePokemonColor: TypePokemonColor) -> Color {
        switch typePokemonColor {
        case .normal: return Color(hex: "#acaa7a")
        case .fighting: return Color(hex: "#c5322a")
        case .flying: return Color(hex: "#9e8ec5")
        case .poison: return Color(hex: "#9e4299")
        case .ground: return Color(hex: "#e0c266")
        case .rock: return Color(hex: "#b9a438")
        case .bug: return Color(hex: "#aabb39")
        case .ghost: return Color(hex: "#71599a")
        case .steel: return Color(hex: "#b8b8d2")
        case .fire: return Color(hex: "#f17f2d")
        case .water: return Color(hex: "#6e8bc6")
        case .grass: return Color(hex: "#79c251")
        case .electric: return Color(hex: "#f7d334")
        case .psychic: return Color(hex: "#f15788")
        case .ice: return Color(hex: "#98d6d5")
        case .dragon: return Color(hex: "#6357a6")
        case .dark: return Color(hex: "#905a4a")
        case .fairy: return Color(hex: "#f7cbdf")
        case .stellar: return .yellow
        case .unknown: return .gray
        }
    }
}

enum TypePokemonColor {
    case normal
    case fighting
    case flying
    case poison
    case ground
    case rock
    case bug
    case ghost
    case steel
    case fire
    case water
    case grass
    case electric
    case psychic
    case ice
    case dragon
    case dark
    case fairy
    case stellar
    case unknown
}

extension String {
    func toTypePokemonColor() -> TypePokemonColor {
        print(self)
        switch self {
            case "normal": return .normal
            case "fighting": return .fighting
            case "flying": return .flying
            case "poison": return .poison
            case "ground": return .ground
            case "rock": return .rock
            case "bug": return .bug
            case "ghost": return .ghost
            case "steel": return .steel
            case "fire": return .fire
            case "water": return .water
            case "grass": return .grass
            case "electric": return .electric
            case "psychic": return .psychic
            case "ice": return .ice
            case "dragon": return .dragon
            case "dark": return .dark
            case "fairy": return .fairy
            case "stellar": return .stellar
            case "unknown": return .unknown
            default: return .unknown
        }
    }
}
