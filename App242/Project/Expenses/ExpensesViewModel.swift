//
//  ExpensesViewModel.swift
//  App242
//
//  Created by Вячеслав on 11/1/23.
//

import SwiftUI
import CoreData

final class ExpensesViewModel: ObservableObject {
    
    @Published var expenses: [ExpensesModel] = []
    
    @Published var name: String = ""
    @Published var cost: String = ""
    @Published var category: String = ""
    
    @Published var categories: [String] = ["food", "transport", "safari", "hotel"]
    
    @Published var isAdd: Bool = false
    
    func fetchExpenses() {
        
        CoreDataStack.shared.modelName = "ExpensesModel"
        let context = CoreDataStack.shared.persistentContainer.viewContext
        let fetchRequest = NSFetchRequest<ExpensesModel>(entityName: "ExpensesModel")

        do {
            
            let branch = try context.fetch(fetchRequest)
            
            self.expenses = branch
            
        } catch let error as NSError {
            
            print("Error fetching persons: \(error), \(error.userInfo)")
            
            self.expenses = []
        }
    }
    
    func addExpense(completion: @escaping () -> (Void)) {
        
        CoreDataStack.shared.modelName = "ExpensesModel"
        let context = CoreDataStack.shared.persistentContainer.viewContext
        let trans = NSEntityDescription.insertNewObject(forEntityName: "ExpensesModel", into: context) as! ExpensesModel
        
        trans.name = name
        trans.category = category
        trans.cost = Int16(cost) ?? 0
        
        CoreDataStack.shared.saveContext()
        
        completion()
    }
}
