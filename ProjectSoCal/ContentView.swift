//
//  ContentView.swift
//  ProjectSoCal
//
//  Created by Lukas Thoms on 9/2/19.
//  Copyright © 2019 Lukas Thoms. All rights reserved.
//

import SwiftUI
import ContactsUI

struct ContentView: View {
    
    @State private var planTitle = ""
    @State private var planTime = Date()
    @State private var planMessage = ""
    @ObservedObject var invitees = Invitees()
    
    var body: some View {
        
        NavigationView {

            VStack {
                
                Text("Make a New Plan")
                
                TextField("Enter a description", text: $planTitle)
                
                DatePicker(selection: $planTime) {
                    Text("Date")
                }
                
                TextField("Enter a message", text: $planMessage).padding(15.0)
                
                ForEach(invitees.contacts, id: \.identifier) { contact in
                    Text(contact.givenName)
                }
                
                NavigationLink(destination: ContactPickerHack(selectedInvitees: invitees)) {
                    Text("Pick Contacts")
                }.padding(15.0)
                
                Button(action: {
                    APIClient().sendInvite(planTitle: self.planTitle, planDate: self.planTime, planMessage: self.planMessage, invitees: self.invitees)
                    
                }) { Text("Send Invite")
                }.padding(15.0)
            }
        }
        
        
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
