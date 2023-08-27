//
//  Colors.swift
//  MultiFitness
//
//  Created by Eranga prabath on 2023-08-27.
//

import Foundation
import SwiftUI
extension Color{
    
    static let myTheme = coloTheme()

}

struct coloTheme:Identifiable{
    var id = UUID().uuidString
    var mainColor = Color("mainColor")
    var secondaryColor = Color("SecondaryColor")
    var backgroud = Color("backgroundColor")
    var homeExpences = Color("homeExpencesColor")
    var homeExpences2 = Color("homeExpencesColor2")

}
