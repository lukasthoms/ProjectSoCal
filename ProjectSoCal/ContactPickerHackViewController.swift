//
//  ContactPickerHackViewController.swift
//  ProjectSoCal
//
//  Created by Lukas Thoms on 9/2/19.
//  Copyright © 2019 Lukas Thoms. All rights reserved.
//

import UIKit
import ContactsUI
import SwiftUI

class ContactPickerHackViewController: UIViewController {

    var contactPickerDelegate: CNContactPickerDelegate? = nil

    override func viewDidLoad() {
        super.viewDidLoad()
        let viewController = CNContactPickerViewController()
        viewController.delegate = contactPickerDelegate
        viewController.displayedPropertyKeys = [CNContactPhoneNumbersKey]
        viewController.predicateForSelectionOfContact = NSPredicate(value: false)
        present(viewController, animated: true) {
            print("maybe this was successful")
        }
        // Do any additional setup after loading the view.
    }

}

