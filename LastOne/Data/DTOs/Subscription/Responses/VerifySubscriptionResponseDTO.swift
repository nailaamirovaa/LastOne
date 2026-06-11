//
//  VerifySubscriptionResponseDTO.swift
//  LastOne
//
//  Created by Naila Amirova on 03.06.26.
//


import Foundation

//MARK: - Data
struct SubscriptionDataDTO: Decodable {

    let isPremium: Bool?
    let expiresAt: String?
}
