//
//  CoreDataStack.swift
//  WeatherApp
//
//  Created by Ashish Mittal on 23/10/18.
//  Copyright © 2018 Edward L Richardson. All rights reserved.
//

import Foundation
import CoreData
import UIKit

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
    func createNewManagedObject() ->NSManagedObject{
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        
        let context = appDelegate.persistentContainer.viewContext
        let entity = NSEntityDescription.entity(forEntityName: "City", in: context)
        return NSManagedObject(entity: entity!, insertInto: context)
        
    }
    
    
    //fetching data. //how many records in the coredata (based on filteration)
    
    func fetchObjects() -> [City]? {
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        let managedContext =
            appDelegate.persistentContainer.viewContext
        var modelArray:[City]?
        //2
        let fetchRequest =
            NSFetchRequest<NSManagedObject>(entityName: "City")
        
        do {
            modelArray = try managedContext.fetch(fetchRequest) as? [City]
        } catch let error as NSError {
            print("Could not fetch. \(error), \(error.userInfo)")
        }
        
        
        return modelArray
    }

    func deleteEntry(name:String){
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        let managedContext =
            appDelegate.persistentContainer.viewContext
        let fetchRequest =
            NSFetchRequest<NSManagedObject>(entityName: "City")
        
        if let result = try? managedContext.fetch(fetchRequest) {
            for object in result {
                let model = object as! City
                if model.cityName == name{
                    managedContext.delete(model)
                    break
                }
            }
        }

        
        // save to the context
        do {
            try managedContext.save()
        } catch {
            
        }
        
        
    }
    
    
}



