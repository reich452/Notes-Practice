//
//  Note.swift
//  notesTest3
//
//  Created by Nick Reichard on 2/11/17.
//  Copyright © 2017 Nick Reichard. All rights reserved.
//

import Foundation

class Note: Equatable {
    
    private let nameKey = "nameKey"
    
    
    var name: String

    
    init(name: String) {
        
        self.name = name
        
    }
    
    // Saving - Turn our Place class into something that UserDefaults can know how to store. 
    
    var dictionaryRepersentation: [String: String] {
        let dictionary = [nameKey: name] as [String : String]
    
        return dictionary
    }
    
    // Loading - Turn the place's dictionaryRepersentation back into an instance of class Place.
    
    init?(dictionary: [String: String]) {
        if let name = dictionary[nameKey] {
            self.name = name
        }
        else {
            return nil
        }
        
    }
    
}

func==(lhs: Note, rhs: Note) -> Bool {
    return lhs.name == rhs.name
}
