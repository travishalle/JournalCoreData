//
//  EntryDetailViewController.swift
//  JournalCoreData
//
//  Created by Travis Halle on 4/26/21.
//

import UIKit

class EntryDetailViewController: UIViewController {

    //MARK: Outlets
    @IBOutlet weak var entryTitleTextfield: UITextField!
    @IBOutlet weak var entryBodyTextView: UITextView!
    
    //MARK: Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        updateviews()
    }
    
    //MARK: Properties
    var entry: Entry?
    
    //MARK: Actions
    @IBAction func saveEntryButtonTapped(_ sender: Any) {
        guard let title = entryTitleTextfield.text, !title.isEmpty,
              let body = entryBodyTextView.text, !body.isEmpty else {return}
        if let entry = entry {
            entry.title = title
            entry.body = body
            EntryController.sharedInstance.updateEntry()
        } else {
            EntryController.sharedInstance.createEntry(title: title, body: body)
        }
        navigationController?.popViewController(animated: true)
    }
    
    @IBAction func clearTextButtonTapped(_ sender: Any) {
        entryTitleTextfield.text = ""
        entryBodyTextView.text = ""
    }
    
    //MARK: Functions
    func updateviews() {
        guard let entry = entry else {return}
        entryTitleTextfield.text = entry.title
        entryBodyTextView.text = entry.body
    }

}
