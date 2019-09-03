//
//  ContactPickerHack.swift
//  ProjectSoCal
//
//  Created by Lukas Thoms on 9/2/19.
//  Copyright © 2019 Lukas Thoms. All rights reserved.
//

import SwiftUI
import ContactsUI

struct ContactPickerHack: UIViewControllerRepresentable {
    
    var selectedInvitees: Invitees
    
    func makeCoordinator() -> Coordinator {
        Coordinator(self)
    }
    
    func makeUIViewController(context: Context) -> ContactPickerHackViewController {
        let viewController = ContactPickerHackViewController()
        viewController.contactPickerDelegate = context.coordinator
        return viewController
    }
    
    func updateUIViewController(_ contactPickerViewController: ContactPickerHackViewController, context: Context) {
        
    }
    
    class Coordinator: NSObject, CNContactPickerDelegate {
        var parent: ContactPickerHack
        
        init(_ contactPickerHack: ContactPickerHack) {
            self.parent = contactPickerHack
        }
        
        func contactPicker(_ picker: CNContactPickerViewController, didSelect contacts: [CNContact]) {
//            NotificationCenter().post(name: Notification.Name("NewContacts"), object: contacts)
            parent.selectedInvitees.contacts = contacts
            for contact in contacts {
                print(contact.phoneNumbers)
            }
        }
        
        func contactPickerDidCancel(_ picker: CNContactPickerViewController) {
            picker.dismiss(animated: true, completion: nil)
        }
    }
    
}
