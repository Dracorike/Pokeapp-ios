//
//  PokeStatsView.swift
//  PokeApp
//
//  Created by Suprisul on 31/12/24.
//
import SwiftUI

struct PokeStatsView : View{
    let stats:PokeStatsModel
    
    var body : some View {
        VStack{
            PokeStatsBar(labelText: "HP", barValue: stats.hp)
            PokeStatsBar(labelText: "Attack", barValue: stats.attack, barColor: .yellow)
            PokeStatsBar(labelText: "Defense", barValue: stats.defense, barColor: .blue)
            PokeStatsBar(labelText: "SpAttack", barValue: stats.spAttack, barColor: .orange)
            PokeStatsBar(labelText: "SpDefense", barValue: stats.spDefense, barColor: .green)
            PokeStatsBar(labelText: "Speed", barValue: stats.speed, barColor: .purple)
        }
    }
}

#Preview {
    PokeStatsView(stats: PokeStatsModel.mock())
}
