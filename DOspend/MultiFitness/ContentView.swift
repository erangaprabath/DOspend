//
//  ContentView.swift
//  MultiFitness
//
//  Created by Eranga prabath on 2023-08-27.
//

import SwiftUI

struct ContentView: View {
    @State private var showAnnimation:Bool = false
    let lineSize:CGFloat
    var body: some View {
        ZStack{
            Color.black
                .ignoresSafeArea()
            
            VStack{
                ZStack{
                    Circle()
                        .stroke(Color.red.opacity(0.6),style: StrokeStyle(lineWidth: 20,lineCap: .round,lineJoin: .bevel))
                        .blur(radius: 2)
                        .frame(width: 100)
                        
                    Circle()
                        .trim(from: 0,to:showAnnimation ==  true ? lineSize : 0.0)
                        .stroke(Color.red,style: StrokeStyle(lineWidth: 20,lineCap: .round,lineJoin: .bevel))
                        .frame(width: 100)
                        .transition(AnyTransition.move(edge: .trailing))
     
                }
            }
        }.onAppear{
            DispatchQueue.main.asyncAfter(deadline: .now() + 1){
                withAnimation(.linear(duration: 0.7)){
                    showAnnimation.toggle()
                }
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView(lineSize: 0.7)
    }
}
