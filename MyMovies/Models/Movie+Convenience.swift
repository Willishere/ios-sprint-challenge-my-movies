//
//  Entry+Convenience.swift
//  MyMovies
//
//  Created by William Chen on 9/20/19.
//  Copyright © 2019 Lambda School. All rights reserved.
//

import Foundation
import CoreData

extension Movie{
    
    @discardableResult convenience init(title: String, identifier: String = UUID().uuidString, hasWatched: Bool, context: NSManagedObjectContext = CoreDataStack.shared.mainContext) {
        
        self.init(context: context)
        
        self.title = title
        self.hasWatched = hasWatched
        self.identifier = identifier
    }
    
    
    @discardableResult convenience init?(movieRepresentation: MovieRepresentation, context: NSManagedObjectContext) {
        
        guard let title = movieRepresentation.title,
            let hasBeenwatched = movieRepresentation.hasWatched,
            let identifier = entryRepresentation.identifier else { return nil }
        
        self.init(title: title, hasWatched: hasWatched, identifier: identifier, context: context)
    }
    
    var movieRepresentation: MovieRepresentation {
        return MovieRepresentation(title: title, hasWatched: hasWatched, identifier: identifier)
    }
}

