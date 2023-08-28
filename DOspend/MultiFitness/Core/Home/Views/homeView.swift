//
//  homeView.swift
//  MultiFitness
//
//  Created by Eranga prabath on 2023-08-27.
//

import SwiftUI

struct homeView: View {
    @State private var toggleScreen:Int = 0
    @State private var bankBalance:String = ""
    @State private var showErrorPopUp:Bool = false
    @EnvironmentObject private var viewModel:homeViewModel
    @StateObject private var dataModel = savingDataService()
    private var dataSets:[Spends] = []
    var body: some View {
        ZStack{
            Color.black
                .ignoresSafeArea(.all)
            
          
            VStack(alignment: .center,spacing: 10){
                topTextView2
                    .padding(.leading,100)
                statView
                Spacer()
                TextField("add bank balance here", text: $bankBalance)
                    .font(.headline)
                    .padding(.leading)
                    .foregroundColor(Color.white)
                    .frame(height: 55)
                    .frame(maxWidth: .infinity)
                    .background(Color.myTheme.mainColor.opacity(0.4))
                    .cornerRadius(10)
                    .padding(.horizontal)
                
                Button {
                    guard !bankBalance .isEmpty else {
                        
                      return showErrorPopUp = true
                        
                    }
//                    dataModel.addData(bankBlance: Double(bankBalance) ?? 0.0 )
                    bankBalance = ""
                } label: {
                    Text("Submit")
                        .font(.headline)
                        .padding(.leading)
                        .foregroundColor(Color.white)
                        .frame(height: 55)
                        .frame(maxWidth: .infinity)
                        .background(Color.myTheme.mainColor.opacity(0.4))
                        .cornerRadius(10)
                        .padding(.horizontal)
                }

                Spacer()
                bottomNavBar(color1: viewModel.colorSet, color2:viewModel.colorSet)
                    .environmentObject(viewModel)
                Spacer()
            }
            if showErrorPopUp {
                errorMessage
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
                .font(.title)
                .fontWeight(.black)
                .foregroundColor(viewModel.colorSet)
         
                
            
                Text("Monthly Salary: LKR".uppercased())
                    .font(.footnote)
                    .bold()
                    .foregroundColor(viewModel.colorSet)
                    .onTapGesture {
                        
                    }
                  
            
           
                          
            Text("Bank Balance: ".uppercased())
                .font(.footnote)
                .bold()
                .foregroundColor(viewModel.colorSet)
        
        }.frame(maxHeight: 200)
    }
    private var errorMessage:some View{
        ZStack{
            Color.gray.opacity(0.8)
                .ignoresSafeArea()
            VStack{
                ZStack{
                    
                    Text("Data Missing".uppercased())
                        .font(.headline)
                        .fontWeight(.bold)
                        .lineLimit(4)
                        .multilineTextAlignment(.center)
                    Image(systemName: "xmark")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 10,height: 10)
                        .padding()
                        .background(
                        Circle()
                            .foregroundColor(Color.white)
                            .frame(width: 25,height: 25)
                        ).offset(x:50,y:-50)
                        .onTapGesture {
                            showErrorPopUp.toggle()
                        }
                    
                }
            }.frame(width: 100,height: 100)
                .background(
                    RoundedRectangle(cornerRadius: 20)
                        .frame(width: 100,height: 100)
                        .foregroundColor(Color.myTheme.secondaryColor)
                )
        }
    }
   
}
    


struct homeView_Previews: PreviewProvider {
    static var previews: some View {
    homeView()
            .environmentObject(homeViewModel())
    }
}
