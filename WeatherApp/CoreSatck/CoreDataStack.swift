//
//  CoreDataStack.swift
//  WeatherApp
//
//  Created by Ashish Mittal on 23/10/18.
//  Copyright © 2018 Edward L Richardson. All rights reserved.
//

import Foundation
import CoreData

class CoreDataStack{
    
    // how to maka only a single object of the class through out the app.
    
    static let shared = CoreDataStack()
    
    private init(){
        
    }
    
    
    lazy var persistantContainer:NSPersistentContainer = {
        let container = NSPersistentContainer(name: "WeatherApp")
        container.loadPersistentStores(completionHandler: { (storeDescription, error) in
            if let error = error as NSError? {
                
                /*
                 Typical reasons for an error here include:
                 * The parent directory does not exist, cannot be created, or disallows writing.
                 * The persistent store is not accessible, due to permissions or data protection when the device is locked.
                 * The device is out of space.
                 * The store could not be migrated to the current model version.
                 Check the error message to determine what the actual problem was.
                 */
                fatalError("Unresolved error \(error), \(error.userInfo)")
            }
        })
        return container
    }()
    
    func saveContext() {
        let context = persistantContainer.viewContext
        if context.hasChanges {
            do {
                try context.save()  // save method
            } catch {
                // Replace this implementation with code to handle the error appropriately.
                // fatalError() causes the application to generate a crash log and terminate. You should not use this function in a shipping application, although it may be useful during development.
                let nserror = error as NSError
                fatalError("Unresolved error \(nserror), \(nserror.userInfo)")
            }
        }
    }
    
}


extension CoreDataStack{
    
    // let creates a new entity
    //gererics in swift.
    
    
    //adding record to the coredata
    func createNewManagedObject<T: NSManagedObject>(into managedObjectContext: NSManagedObjectContext) -> T? {
        return NSEntityDescription.insertNewObject(forEntityName: NSStringFromClass(T.self), into: managedObjectContext) as? T
    }
    
    
    //fetching data. //how many records in the coredata (based on filteration)
    
    func fetchObject<T: NSManagedObject>(predicateString predicate: String?, inManagedObjectContext context: NSManagedObjectContext,argumentList:[Any]? = nil) -> [T]? {
        
        let fetch = NSFetchRequest<T>(entityName: NSStringFromClass(T.self))
        if let predicate = predicate {
            fetch.predicate = NSPredicate(format: predicate, argumentArray: argumentList)
        }
        var result: [T]?
        do {
            result = try context.fetch(fetch)
        } catch {
            fatalError("Failed to fetch employees: \(error)")
        }
        return result
    }

}



