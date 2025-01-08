//
//  PokeStatsBar.swift
//  PokeApp
//
//  Created by Suprisul on 31/12/24.
//

import SwiftUI

struct PokeStatsBar : View{
    let labelText: String
    let barValue: Double
    var barColor: Color?
    
    var body: some View {
        HStack{
            Text(labelText)
                .frame(width: 50, alignment: .leading)
                .fontWidth(.compressed)
            Capsule()
                .stroke(.black, lineWidth: 2)
                .frame(height: 15)
                .foregroundStyle(.white)
                .overlay {
                    HStack{
                        Capsule()
                            .frame(width: barValue)
                            .foregroundStyle(barColor ?? .red)
                        Spacer()
                    }
                }
        }
    }
    
    init(labelText: String, barValue: Double, barColor: Color? = nil) {
        self.labelText = labelText
        self.barValue = barValue
        self.barColor = barColor
    }
}

#Preview {
    PokeStatsBar(
        labelText: "HP",
        barValue: 48
    )
}
