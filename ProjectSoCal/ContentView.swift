//
//  ContentView.swift
//  ProjectSoCal
//
//  Created by Lukas Thoms on 9/2/19.
//  Copyright © 2019 Lukas Thoms. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    @State private var planTitle = ""
    @State private var planTime = Date()
    @State private var planMessage = ""
    var body: some View {
        
        VStack {
            Text("Welcome to SoCal")
            TextField("Enter a description", text: $planTitle)
                .padding(15.0)
            DatePicker(selection: $planTime) {
                Text("Date")
            }
            TextField("Enter a message", text: $planMessage)
            Button(action: {
                APIClient().sendInvite(planTitle: self.planTitle, planDate: self.planTime, planMessage: self.planMessage)
            }) { Text("Send Invite") }
        }
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
