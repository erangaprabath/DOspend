//
//  bottoNavBar.swift
//  MultiFitness
//
//  Created by Eranga prabath on 2023-08-27.
//

import SwiftUI

struct bottomNavBar: View {
    @EnvironmentObject private var vm:homeViewModel
    @State private var animate:Bool = false
    let color1:Color
    let color2:Color
    @State  var toogle:Int = 0
    var body: some View {
        VStack{
            Spacer()
            iconSet
                .background(
                RoundedRectangle(cornerRadius: 20)
                    .frame(width: 330, height: 80)
                    .foregroundColor(color2.opacity(0.5))
                )
        }.padding()
        .onAppear{
            withAnimation(.linear(duration: 0.8)){
                animate.toggle()
            }
        }
    }
}
extension bottomNavBar{
    private var ststButtonView:some View{
        ZStack{
            Circle()
                .trim(from: 0,to:0.8)
                .stroke(Color.myTheme.mainColor,style: StrokeStyle(lineWidth: 5,lineCap: .round,lineJoin: .bevel))
                .frame(width: 47)
                .rotationEffect(Angle(degrees: animate == true ? 360 : 0))
                .shadow(color: Color.myTheme.homeExpences, radius: 10,x:1,y: 1)
                .shadow(color: Color.myTheme.homeExpences.opacity(0.3), radius: 10,x:1,y: 1)
                
            Circle()
                .trim(from: 0,to:0.8)
                .stroke(Color.myTheme.homeExpences2,style: StrokeStyle(lineWidth: 5,lineCap: .round,lineJoin: .bevel))
                .frame(width: 35)
                .rotationEffect(Angle(degrees: animate == true ? -360 : 0))
          
            Circle()
                .trim(from: 0,to:0.8)
                .stroke(Color.myTheme.homeExpences,style: StrokeStyle(lineWidth: 5,lineCap: .round,lineJoin: .bevel))
                .frame(width: 23)
                .rotationEffect(Angle(degrees: animate == true ? 360 : 0))
          
                
        }.frame(width: 50,height: 50)
    }
    private var iconSet:some View{
        HStack(spacing: 50.0){
            ststButtonView
                .onTapGesture {
                    

                    withAnimation(.linear(duration: 0.5)){
                        vm.getcoloCode(colorCode: vm.toggleScreen)
                        vm.toggleScreen += 1
                        animate.toggle()
                        if (vm.toggleScreen == 2){
                            vm.toggleScreen -= 2
                        }
                       
                    }
                    print(vm.toggleScreen)
                }
            Image(systemName: "pencil.and.ellipsis.rectangle")
                .resizable()
                .scaledToFit()
                .frame(width: 30,height: 30)
                .foregroundColor(color2)
            Image(systemName: "doc.plaintext")
                .resizable()
                .scaledToFit()
                .frame(width: 30,height: 30)
                .foregroundColor(color2)
            Image(systemName: "person.crop.circle")
                .resizable()
                .scaledToFit()
                .frame(width: 30,height: 30)
                .foregroundColor(color2)
          
            
        }

    }
    
}

struct bottomNavBar_Previews: PreviewProvider {
    static var previews: some View {
        bottomNavBar(color1: Color.black, color2: Color.brown)
    }
}
