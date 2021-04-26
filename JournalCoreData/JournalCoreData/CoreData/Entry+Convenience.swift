//
//  Entry+Convenience.swift
//  JournalCoreData
//
//  Created by Travis Halle on 4/26/21.
//

import CoreData

extension Entry {
    @discardableResult convenience init(title: String, body: String, timeStamp: Date = Date(), uuid: String = UUID().uuidString, context: NSManagedObjectContext = CoreDataStack.context) {
        self.init(context: context)
        self.title = title
        self.body = body
        self.timeStamp = timeStamp
        self.uuid = uuid
    }
}//End of extension
