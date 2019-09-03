//
//  NewPlanContacts.swift
//  ProjectSoCal
//
//  Created by Lukas Thoms on 9/2/19.
//  Copyright © 2019 Lukas Thoms. All rights reserved.
//

import SwiftUI
import ContactsUI
import Combine

class Invitees : ObservableObject {
    var objectWillChange = PassthroughSubject<Void, Never>()
    var contacts: [CNContact] = [] { willSet { objectWillChange.send() } }
}


