//
//  PokeAppApp.swift
//  PokeApp
//
//  Created by Suprisul on 17/12/24.
//

import SwiftUI

@main
struct PokeAppApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView(viewModel: PokemonMainViewModel())
        }
    }
}
