//
//  UserDTO.swift
//  LastOne
//
//  Created by Naila Amirova on 03.06.26.
//

import Foundation

struct UserDTO: Decodable {

    let id: String
    let email: String
    let isOnboardingComplete: Bool
    let subscriptionStatus: String?
}
