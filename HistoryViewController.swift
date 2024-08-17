//
//  HistoryViewController.swift
//  PawCus
//
//  Created by STDC_27 on 08/08/2024.
//

import UIKit

class HistoryViewController: UIViewController, UITableViewDataSource, UITableViewDelegate, NewEntryDelegate {

    @IBOutlet var tableView: UITableView!

    var tableData: [JournalHistory] = []

    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.dataSource = self
        tableView.delegate = self
        tableData = JournalHistory.sampleJournalHistory()
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return tableData.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let journalCell = tableView.dequeueReusableCell(withIdentifier: "journalHistory", for: indexPath) as! HistoryTableViewCell
        let journalHistory = tableData[indexPath.row]
        journalCell.photoImageView.image = journalHistory.photo
        journalCell.dayLabel.text = journalHistory.day
        journalCell.dateLabel.text = journalHistory.date
        journalCell.recordLabel.text = journalHistory.record
        return journalCell
    }

    // MARK: - Navigation

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "showJournal" {
            guard let detailVC = segue.destination as? DetailJournalViewController,
                  let selectedCell = sender as? HistoryTableViewCell,
                  let indexPath = tableView.indexPath(for: selectedCell) else {
                fatalError("Could not get indexPath")
            }
            let selectedJournalHistory = tableData[indexPath.row]
            detailVC.selectedJournalHistory = selectedJournalHistory

        } else if segue.identifier == "newEntry" {
            guard let newEntryVC = segue.destination as? NewEntryViewController else {
                fatalError("Could not cast destination view controller.")
            }
            newEntryVC.delegate = self
        }
    }

    // MARK: - NewEntryDelegate

    func didAddNewJournalHistory(_ journalHistory: JournalHistory) {
        tableData.append(journalHistory)
        tableView.reloadData()
    }
    
    // MARK: - Actions
    @IBAction func enterTapped(_ sender: UIButton) {
        performSegue(withIdentifier: "newEntry", sender: self)
    }
    
}
