//
//  DataBaseManager.swift
//  SwiftUiCoreData
//
//  Created by Neosoft on 09/11/23.
//

import Foundation
import CoreData
class DataBaseManager{
    let presistentContainer : NSPersistentContainer
    
    static let shared = DataBaseManager()
    
    private init() {
        self.presistentContainer = NSPersistentContainer(name: "Employee")
        presistentContainer.loadPersistentStores { desc, error in
            if let error = error{
                fatalError("some thing went wrong")
            }
        }
    }
    
    func updateEmpData(){
        do{
            try presistentContainer.viewContext.save()
        }catch{
            presistentContainer.viewContext.rollback()
            print("error in Saving the data")
        }
    }
    
    func saveEmployeeData(fname:String,lname:String){
        let empdata = EmpData(context: presistentContainer.viewContext)
        empdata.fname = fname
        empdata.lname = lname
        
        do {
            try presistentContainer.viewContext.save()
        }catch{
            print("there is some error is happened in saving data ")
        }
        
    }
    
    func getAllData() -> [EmpData]{
        let fetchReq : NSFetchRequest<EmpData> = EmpData.fetchRequest()
        do {
            return try presistentContainer.viewContext.fetch(fetchReq)
        } catch{
            print("error in fetching data")
            return []
        }
        
    }
    
    func deleteEmpData(empdata: EmpData){
        presistentContainer.viewContext.delete(empdata)
        
        do{
            try presistentContainer.viewContext.save()
        }catch{
            presistentContainer.viewContext.rollback()
            print("error in deleting the data")
        }
    }
    
}
