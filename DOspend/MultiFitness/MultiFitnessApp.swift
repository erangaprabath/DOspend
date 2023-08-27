//
//  MultiFitnessApp.swift
//  MultiFitness
//
//  Created by Eranga prabath on 2023-08-27.
//

import SwiftUI

@main
struct MultiFitnessApp: App {
    @StateObject private var viewModel = homeViewModel()
    var body: some Scene {
        WindowGroup {
            homeView()
                .environmentObject(viewModel)
           
                .preferredColorScheme(.light)
        }
    }
}
