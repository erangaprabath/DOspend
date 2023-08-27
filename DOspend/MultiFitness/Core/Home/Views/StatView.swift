//
//  StatView.swift
//  MultiFitness
//
//  Created by Eranga prabath on 2023-08-27.
//

import SwiftUI

struct StatView: View {
    @State private var showAnnimation:Bool = false
    @State private var homeExpences:Bool = false
    let ststValue:Double
    let coloThem:LinearGradient
    let shadowColor:Color
    let imageName:String
    let startPoint:Double
    let topic:String
    let amountOfSpend:String
    var body: some View {
        VStack(alignment: .center, spacing: 30.0){
           topTextView
           statPreview
        }
        .padding()
        .onAppear{
            withAnimation(.linear(duration: 0.7))
            {
                showAnnimation.toggle()
            }
        }
    }
}
extension StatView{
 
    private var topTextView:some View{
        VStack{
            Text(amountOfSpend)
                .font(.title2)
                .fontWeight(.bold)
                .foregroundColor(Color.white)
            Text(topic.uppercased())
                .font(.caption)
                .fontWeight(.bold)
                .foregroundColor(shadowColor)
        }
    }
    private var statPreview:some View{
        ZStack {
            
            Circle()
                .stroke(shadowColor.opacity(0.3),
                        style: StrokeStyle(lineWidth: 50,lineCap: .round,lineJoin: .bevel)
                        
                )
                .shadow(color: shadowColor, radius: 80,x:10,y: 10)
                .shadow(color: shadowColor.opacity(0.3), radius: 90,x:10,y: 10)
                .frame(width: 200,height: 200)
            
            Image(systemName: imageName)
                .resizable()
                .scaledToFit()
                .frame(width: 40,height: 40)
                .foregroundColor(shadowColor)
            
            
            Circle()
                .trim(from: 0 ,to: showAnnimation == true ? ststValue : 0.0)
                .stroke(coloThem,style: StrokeStyle(lineWidth: 60,lineCap: .butt,lineJoin: .round))
                .shadow(color: Color.black.opacity(0.25), radius: 10)
                .frame(width: 200,height: 200)
            
            
        }.padding()
    }
}

struct StatView_Previews: PreviewProvider {
    static var previews: some View {
        StatView(ststValue: 0.2,coloThem: LinearGradient(colors: [Color.myTheme.homeExpences,Color.myTheme.homeExpences2], startPoint: .top, endPoint: .bottom),shadowColor: Color.myTheme.homeExpences,imageName: "car",startPoint: 1000,topic: "",amountOfSpend: "")
    }
}
