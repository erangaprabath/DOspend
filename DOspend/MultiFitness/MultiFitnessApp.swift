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
    @State private var showMainMenu:Bool = true
    var body: some Scene {
        WindowGroup {
            ZStack{
                if showMainMenu == true{
                    SplashScreen()
                        .transition(.move(edge: .leading))
                        .onAppear{
                            DispatchQueue.main.asyncAfter(deadline: .now() + 2){
                                showMainMenu.toggle()
                            }
                        }
                        
                  
                }
                else{
                    homeView()
                        .environmentObject(viewModel)
                        .preferredColorScheme(.light)
                }
            }
          
            
           
        }
    }
}
