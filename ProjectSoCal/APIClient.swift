//
//  PlanViewModel.swift
//  ProjectSoCal
//
//  Created by Lukas Thoms on 9/2/19.
//  Copyright © 2019 Lukas Thoms. All rights reserved.
//

import Foundation
import Alamofire

class APIClient {
    func sendInvite(planTitle: String, planDate: Date, planMessage: String, invitees: Invitees) {

        let formattedInvitees = invitees.contacts.compactMap { (contact) -> [String:String]? in
            if let phoneNumber = contact.phoneNumbers.first?.value {
                let phoneNumberString = phoneNumber.stringValue
                return ["inviteeFirstName": contact.givenName,
                "inviteePhoneNumber" : phoneNumberString]
            } else {
                return nil
            }
        }

        let params: Parameters = [
            "userFirstName" : "Lukas",
            "userLastName" : "Thoms",
            "planTitle" : planTitle,
            "planDate" : planDate,
            "planMessage" : planMessage,
            "invitees" : formattedInvitees]
        
        AF.request("https://project-socal.glitch.me/new-plan", method: .post, parameters: params).responseJSON { response in
            print(response)
        }
    }
}


