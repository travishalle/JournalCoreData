//
//  EntryController.swift
//  JournalCoreData
//
//  Created by Travis Halle on 4/26/21.
//

import CoreData

class EntryController {
    
    //MARK: Properties
    static let sharedInstance = EntryController()
    var entries: [Entry] = []
    
    private lazy var fetchRequest: NSFetchRequest<Entry> = {
        let request = NSFetchRequest<Entry>(entityName: "Entry")
        request.predicate = NSPredicate(value: true)
        return request
    }()
    
    private init() {}
    
    //MARK: Functions
    func createEntry(title: String, body: String) {
        let entry = Entry(title: title, body: body)
        entries.append(entry)
        CoreDataStack.saveContext()
    }
    
    func fetchEntry() {
        let entries = (try? CoreDataStack.context.fetch(self.fetchRequest)) ?? []
        print(entries.count)
        self.entries = entries
    }
    
    func updateEntry() {
        CoreDataStack.saveContext()
    }
    
    func deleteEntry(entryToDelete: Entry) {
        guard let index = entries.firstIndex(of: entryToDelete) else {return}
        entries.remove(at: index)
        CoreDataStack.saveContext()
    }
}
