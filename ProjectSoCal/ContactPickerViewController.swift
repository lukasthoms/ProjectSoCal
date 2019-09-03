//
//  ContactPickerView.swift
//  ProjectSoCal
//
//  Created by Lukas Thoms on 9/2/19.
//  Copyright © 2019 Lukas Thoms. All rights reserved.
//

import SwiftUI
import ContactsUI

struct ContactPickerViewController: UIViewControllerRepresentable {
    
    func makeCoordinator() -> Coordinator {
        Coordinator(self)
    }
    
    func makeUIViewController(context: Context) -> CNContactPickerViewController {
        let viewController = CNContactPickerViewController()
        viewController.delegate = context.coordinator
        viewController.displayedPropertyKeys = [CNContactPhoneNumbersKey]
        viewController.predicateForSelectionOfContact = NSPredicate(value: false)
        viewController.modalPresentationStyle = .overCurrentContext
        return viewController
    }
    
    func updateUIViewController(_ contactPickerViewController: CNContactPickerViewController, context: Context) {
        
    }
    
    class Coordinator: NSObject, CNContactPickerDelegate {
        var parent: ContactPickerViewController
        
        init(_ contactPickerViewController: ContactPickerViewController) {
            self.parent = contactPickerViewController
        }
        
        func contactPicker(_ picker: CNContactPickerViewController, didSelect contacts: [CNContact]) {
            for contact in contacts {
                print(contact.phoneNumbers)
            }
        }
        
        func contactPickerDidCancel(_ picker: CNContactPickerViewController) {
            picker.dismiss(animated: true, completion: nil)
        }
    }
}


