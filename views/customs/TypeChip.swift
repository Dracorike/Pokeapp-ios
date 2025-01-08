//
//  TypeChip.swift
//  PokeApp
//
//  Created by Suprisul on 30/12/24.
//

import SwiftUI

struct TypeChip: View {
    let chipInfo: TypeChipModel
    var body: some View {
        Capsule()
            .frame(width: 100, height: 35)
            .foregroundColor(chipInfo.color)
            .overlay {
                Text(chipInfo.name).foregroundStyle(.white)
            }
    }
}

#Preview {
    let chip = TypeChipModel(name: "Grass", color: Color(hex: "#acaa7a"))
    TypeChip(chipInfo: chip)
}
