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
    func sendInvite(planTitle: String, planDate: Date, planMessage: String) {

        let params: Parameters = [
            "userFirstName" : "Lukas",
            "userLastName" : "Thoms",
            "planTitle" : planTitle,
            "planDate" : planDate,
            "planMessage" : planMessage ]
        
        AF.request("https://project-socal.glitch.me/new-plan", method: .post, parameters: params).responseJSON { response in
            print(response)
        }
    }
}


