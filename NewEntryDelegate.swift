//
//  NewEntryDelegate.swift
//  PawCus
//
//  Created by STDC_32 on 11/08/2024.
//

import UIKit

// Define the protocol
protocol NewEntryDelegate: AnyObject {
    func didAddNewJournalHistory(_ journalHistory: JournalHistory)
}

