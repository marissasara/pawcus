//
//  NewEntryViewController.swift
//  PawCus
//
//  Created by STDC_32 on 11/08/2024.
//

import UIKit

class NewEntryViewController: UIViewController, UIImagePickerControllerDelegate & UINavigationControllerDelegate {

    @IBOutlet weak var photoImageView: UIImageView!
    @IBOutlet weak var datePicker: UIDatePicker!
    @IBOutlet weak var contentTextView: UITextView!
    @IBOutlet weak var recordTextField: UITextField!
    
    // Add a delegate property
    weak var delegate: NewEntryDelegate?

    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Set default date picker value to today's date
        datePicker.date = Date()
        contentTextView.layer.borderWidth = 1.0
        contentTextView.layer.borderColor = UIColor.lightGray.cgColor
        contentTextView.layer.cornerRadius = 5.0
    }

    @IBAction func selectPhotoButtonTapped(_ sender: UIButton) {
        let imagePicker = UIImagePickerController()
        imagePicker.delegate = self
        imagePicker.sourceType = .photoLibrary // or .camera
        present(imagePicker, animated: true, completion: nil)
    }

    @IBAction func saveButtonTapped(_ sender: UIButton) {
        // Validate and save the new journal entry
        guard let record = recordTextField.text, !record.isEmpty,
              let content = contentTextView.text, !content.isEmpty else {
            showAlert(message: "Please fill in all fields.")
            return
        }

        // Create a new JournalHistory object
        let newJournalHistory = JournalHistory(
            photo: photoImageView.image,
            day: formattedDay(from: datePicker.date),
            date: formattedDate(from: datePicker.date),
            record: record,
            content: content
        )

        // Pass the new entry to the previous view controller
        delegate?.didAddNewJournalHistory(newJournalHistory)
        navigationController?.popViewController(animated: true)
    }

    private func formattedDate(from date: Date) -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateStyle = .medium
        return dateFormatter.string(from: date)
    }

    private func formattedDay(from date: Date) -> String {
        let dayFormatter = DateFormatter()
        dayFormatter.dateFormat = "EEEE"
        return dayFormatter.string(from: date)
    }

    private func showAlert(message: String) {
        let alert = UIAlertController(title: "Error", message: message, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK", style: .default))
        present(alert, animated: true)
    }

    // MARK: - UIImagePickerControllerDelegate

    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        if let image = info[.originalImage] as? UIImage {
            photoImageView.image = image
        }
        dismiss(animated: true, completion: nil)
    }

    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        dismiss(animated: true, completion: nil)
    }
}
