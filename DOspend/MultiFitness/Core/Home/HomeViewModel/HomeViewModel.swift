//
//  HomeViewModel.swift
//  MultiFitness
//
//  Created by Eranga prabath on 2023-08-27.
//

import Foundation
import SwiftUI
import CoreData


class homeViewModel:ObservableObject{
    
    @Published var statAmount:Double = 0.0
    @Published var homeStatAmount:Double = 0.0
    @Published var startPoint:Double = 10000.0
    @Published var showAnnimation:Bool = false
    @Published var toggleScreen:Int = 0
    @Published var colorSet:Color = Color.myTheme.mainColor
    @Published var bankData:[Spends] = []
    private var dataSet = savingDataService()
    let dataManager = savingDataService()
    
    init(){
        countStatAmount()
        countHomeStatAmount()
//        setBankDetailsData()
    }
//    func fetchData(){
//        let request = NSFetchRequest<Spends>(entityName: "Spends")
//        do{
//         saveEntity = try container.viewContext.fetch(request)
//        } catch{
//            print("Error fetching..\(error)")
//        }
//    }
//    
//    func addData(bankBlance:Double){
//        
//        let newBankBalance = Spends(context: container.viewContext)
//        newBankBalance.bankSaving = bankBlance
//        saveData()
//        
//        
//    }
//    
//   
//    
//    func delete(offSets:Spends?){
//        guard let index = offSets?.bankSaving else { return }
//        guard let entity = saveEntity.first else { return }
//        container.viewContext.delete(entity)
//        saveData()
//        
//    }
        private func countStatAmount(){
        let stat = 1 - ((10000.0 - 600.0)/10000)
        statAmount = stat
        
        
    }
    private func countHomeStatAmount(){
        let stat = 1 - ((10000.0 - 9000.0)/10000)
        homeStatAmount = stat
    }
    func getcoloCode(colorCode:Int){
        if (colorCode == 1){
            colorSet = Color.myTheme.mainColor
        }
        else if (colorCode == 0){
            colorSet =  Color.myTheme.homeExpences2
        }
    }
    
//    private func setBankDetailsData(){
//        var newDataSet = dataSet.saveEntity
//        newDataSet = bankData
//        
//    }
}
