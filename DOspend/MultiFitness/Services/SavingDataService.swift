//
//  SavingDataService.swift
//  MultiFitness
//
//  Created by Eranga prabath on 2023-08-28.
//

import Foundation
import CoreData

class savingDataService:ObservableObject{
    let container:NSPersistentContainer
    @Published var saveEntity:[SpedingTitle] = []
    init(){
        container = NSPersistentContainer(name:"spendsAndRecordings")
        container.loadPersistentStores { (description,error) in
            if let error{
                print("error\(error)")
            }else{
                print("sucesss")
            }
        
            
        }
        fetchData()
        
    }
    
    func fetchData(){
        let request = NSFetchRequest<SpedingTitle>(entityName: "SpedingTitle")
        do{
         saveEntity = try container.viewContext.fetch(request)
        } catch{
            print("Error fetching..\(error)")
        }
    }
    
    func addData(bankBlance:String){
        
        let newBankBalance = SpedingTitle(context: container.viewContext)
        newBankBalance.titelOfSpend = bankBlance
        saveData()
        
        
    }
    
   
    
    func delete(offSets:Spends?){
        guard let index = offSets?.bankSaving else { return }
        guard let entity = saveEntity.first else { return }
        container.viewContext.delete(entity)
        saveData()
        
    }
    
    func saveData(){
        do{
            try container.viewContext.save()
            fetchData()
            
        }catch  let error{
            print("Error popUp \(error)")
        }
    }
}
