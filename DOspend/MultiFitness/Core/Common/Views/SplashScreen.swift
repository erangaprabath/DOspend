//
//  SplashScreen.swift
//  MultiFitness
//
//  Created by Eranga prabath on 2023-08-27.
//

import SwiftUI

struct SplashScreen: View {
    @State var animate:Bool = false
    var body: some View {
        ZStack{
            Color.black
                .ignoresSafeArea()
            VStack{
                ZStack{
                    Circle()
                        .trim(from: 0,to:0.8)
                        .stroke(Color.myTheme.mainColor,style: StrokeStyle(lineWidth: 25,lineCap: .round,lineJoin: .bevel))
                        .frame(width: 210)
                        .rotationEffect(Angle(degrees: animate == true ? 360 : 0))
                        .shadow(color: Color.myTheme.mainColor, radius: 50,x:10,y: 10)
                        .shadow(color: Color.myTheme.mainColor.opacity(0.3), radius: 50,x:10,y: 10)
                        
                    Circle()
                        .trim(from: 0,to:0.8)
                        .stroke(Color.myTheme.homeExpences2,style: StrokeStyle(lineWidth: 35,lineCap: .round,lineJoin: .bevel))
                        .frame(width: 145)
                        .rotationEffect(Angle(degrees: animate == true ? -360 : 0))
                  
                    Circle()
                        .trim(from: 0,to:0.8)
                        .stroke(Color.myTheme.homeExpences,style: StrokeStyle(lineWidth: 25,lineCap: .round,lineJoin: .bevel))
                        .frame(width: 80)
                        .rotationEffect(Angle(degrees: animate == true ? 360 : 0))
                  
                        
                }
            }
        }.onAppear{
            withAnimation(.linear(duration: 2)){
                animate.toggle()
                
            }
        }
    }
}

struct SplashScreen_Previews: PreviewProvider {
    static var previews: some View {
        SplashScreen()
    }
}
