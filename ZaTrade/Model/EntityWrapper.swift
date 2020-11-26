import Foundation
import UIKit
import CoreData

class EntityWrapper<Entity: NSManagedObject> {
    static private var context: NSManagedObjectContext {
        let appDeleagte = UIApplication.shared.delegate as! AppDelegate
        return appDeleagte.persistentContainer.viewContext
    }
    
    var entity: Entity?
    
    init(_ entity: Entity? = nil) {
        self.entity = entity
    }
    
    func save() {
        let context = EntityWrapper<Entity>.context
        if context.hasChanges {
            do {
                try context.save()
            } catch {
                print(error.localizedDescription)
            }
        }
    }
    
    func delete() {
        let context = EntityWrapper<Entity>.context
        context.delete(self.entity!)
        do {
            try context.save()
        } catch {
            print(error.localizedDescription)
        }
    }
    
    static func createNew() -> EntityWrapper<Entity> {
        let entity = Entity(context: context)
        let result = EntityWrapper<Entity>(entity)
        return result
    }
        
    static func getById(id: Int) -> EntityWrapper<Entity> {
        return self.getByField(field: "id", value: id)
    }
    
    static func getByName(name: String) -> EntityWrapper<Entity> {
        return self.getByField(field: "name", value: name)
    }
    
    static private func getByField(field: String, value: Any) -> EntityWrapper<Entity> {
        var result = EntityWrapper<Entity>()
        
        let request = Entity.fetchRequest()
        request.returnsObjectsAsFaults = false
        request.predicate = NSPredicate(format: "\(field) = %@", argumentArray: [value])
        
        do {
            let entities = try context.fetch(request)
            result = EntityWrapper<Entity>(entities[0] as? Entity)
        } catch {
            print(error.localizedDescription)
        }
        
        return result
    }
    
    static func all(sortKey: String? = nil, ascending: Bool = true) -> [EntityWrapper<Entity>] {
        let context = EntityWrapper<Entity>.context
        var result: [EntityWrapper<Entity>] = []
        
        let request = Entity.fetchRequest()
        request.returnsObjectsAsFaults = false
        if (sortKey != nil) {
            let sortOptions = NSSortDescriptor(key: sortKey, ascending: ascending)
            request.sortDescriptors = [sortOptions]
        }
        
        do {
            let entities = try context.fetch(request)
            
            for entity in entities {
                result.append(EntityWrapper<Entity>(entity as? Entity))
            }
        } catch {
            print(error.localizedDescription)
        }

        return result
    }
    
    static func filter() -> [EntityWrapper<Entity>] {
        return []
    }
    
}

extension EntityWrapper: CustomStringConvertible {
    var description: String {
        return String(describing: self.entity ?? nil)
    }
}
