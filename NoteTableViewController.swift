//
//  NoteTableViewController.swift
//  notesTest3
//
//  Created by Nick Reichard on 2/11/17.
//  Copyright © 2017 Nick Reichard. All rights reserved.
//

import UIKit

class NoteTableViewController: UITableViewController {

    override func viewDidLoad() {
        super.viewDidLoad()


    }




    // MARK: - Table view data source
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return NotesController.sharedController.notes.count
    }
    
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "noteDetail", for: indexPath)
        let note = NotesController.sharedController.notes[indexPath.row]
        cell.textLabel?.text = note.name
        
        
        return cell
    }
    
    
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            tableView.deleteRows(at: [indexPath], with: .fade)
            let note = NotesController.sharedController.notes[indexPath.row]
            
            NotesController.sharedController.remove(note: note)
            
            tableView.deleteRows(at: [indexPath], with: .fade)
            
            
        }
    }
    
    // MARK: - Navigation
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "toEditNote" {
            // What - a Note 
            
            if let indexPath = tableView.indexPathForSelectedRow {
                let note = NotesController.sharedController.notes[indexPath.row]
                
                let noteListTVC = segue.destination as? NoteDetailViewController
                
                noteListTVC?.note = note
            }
            
        }
    }
}
