//
//  homeView.swift
//  MultiFitness
//
//  Created by Eranga prabath on 2023-08-27.
//

import SwiftUI

struct homeView: View {
    @State private var toggleScreen:Int = 0
    @EnvironmentObject private var viewModel:homeViewModel
    var body: some View {
        ZStack{
            Color.black
                .ignoresSafeArea(.all)
            VStack(alignment: .center,spacing: 10){
                topTextView2
                    .padding(.leading,100)
                statView
                Spacer()
                bottomNavBar(color1: viewModel.colorSet, color2:viewModel.colorSet)
                    .environmentObject(viewModel)
                Spacer()
            }
        }
    }
}


extension homeView{
    private var statView:some View{
        VStack{
            if (viewModel.toggleScreen == 0){
                StatView(ststValue: viewModel.statAmount,coloThem: LinearGradient(colors: [Color.myTheme.mainColor,Color.myTheme.secondaryColor], startPoint: .top, endPoint: .bottom),shadowColor: Color.myTheme.mainColor,imageName: "bag.fill",startPoint: viewModel.startPoint,topic: "Grocery",amountOfSpend: "LKR \(viewModel.startPoint)")
                    .frame(maxWidth: 400)
                    .transition(.move(edge: .leading))
                
            }
            else if(viewModel.toggleScreen == 1) {
                StatView(ststValue: viewModel.homeStatAmount,coloThem: LinearGradient(colors: [Color.myTheme.homeExpences,Color.myTheme.homeExpences], startPoint: .top, endPoint: .bottom),shadowColor: Color.myTheme.homeExpences2,imageName: "house.fill",startPoint: viewModel.startPoint,topic: "Home Expences",amountOfSpend: "LKR \(viewModel.startPoint)")
                    .frame(maxWidth: 400)
                    .transition(.move(edge: .trailing))
                
            }else{
                Text("End of views")
                    .foregroundColor(Color.myTheme.homeExpences2)
            }
        }
    }
    private var nextButton:some View{
        Image(systemName: "car")
            .frame(width: 50,height: 50)
            .foregroundColor(Color.white)
            .onTapGesture {
                withAnimation(.linear(duration: 0.5)){
                    toggleScreen += 1
                    if (toggleScreen == 2){
                        toggleScreen -= 2
                    }
                    
                }
            }
    }
    private var topTextView2:some View{
        VStack(alignment: .trailing){
            Text("\(Date().asShortDateString())")
                .font(.title3)
                .foregroundColor(Color.myTheme.mainColor)
            
            Text("Monthly Salary: LKR 76k".uppercased())
                .font(.headline)
                .foregroundColor(Color.myTheme.mainColor)
              
            Text("Bank Balance: LKR 313.2K".uppercased())
                .font(.headline)
                .foregroundColor(Color.myTheme.mainColor)
        
        }
    }
   
}
    


struct homeView_Previews: PreviewProvider {
    static var previews: some View {
        homeView()
    }
}
