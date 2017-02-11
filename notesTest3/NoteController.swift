//
//  NoteController.swift
//  notesTest3
//
//  Created by Nick Reichard on 2/11/17.
//  Copyright © 2017 Nick Reichard. All rights reserved.
//
// CRUD
// Singelton
//

import Foundation


class NotesController {
    
    static let sharedController = NotesController()
    
    var notes: [Note] = []
    
    private let noteKeyDictioanryArrayKey = "noteKeyDictionaryArrayKey"
    
    init() {
        
    }
    
    // MARK: - Create
    
    func addNotesWith(name: String) {
        // Create a note
        let note = Note(name: name)
        
        // Add it to the notes array
        
        notes.append(note)
        
    }
    
    
    // MARK: - Save
    
    // The goal is to take our notes Array and save them into UserDefaults. (note that we must convert the places into something that UserDefaults can atually store)
    func saveToPersistentStore() {
        
        var notesDictionaryArray: [[String: String]] = []
        
        for note in notes {
            
            let noteDictionary = note.dictionaryRepersentation
                notesDictionaryArray.append(noteDictionary)
    
        }
            UserDefaults.standard.set(notesDictionaryArray, forKey: noteKeyDictioanryArrayKey)
        
    }
    
    // The goal is to get our place dictionaries out of UserDefaults, turn them back
    // into instances of the Place class, and set the placeArray.
    
    
    func loadToPersistentStore() {
        if let noteDictionaries = UserDefaults.standard.object(forKey: noteKeyDictioanryArrayKey) as? [[String: String]] {
            
            var notes: [Note] = []
            
            for notesDictionary in noteDictionaries {
                
                if let note = Note(dictionary: notesDictionary) {
                    notes.append(note)
                }
                
            }
            self.notes = notes
        }
        
    }

    func remove(note: Note) {
        guard let index = notes.index(of: note) else {
            return
        }
        notes.remove(at: index)
        saveToPersistentStore()
    }
    
}
