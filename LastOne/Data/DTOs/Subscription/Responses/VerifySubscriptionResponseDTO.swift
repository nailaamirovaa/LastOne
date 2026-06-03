//
//  VerifySubscriptionResponseDTO.swift
//  LastOne
//
//  Created by Naila Amirova on 03.06.26.
//


import Foundation

struct  VerifySubscriptionResponseDTO: Decodable {

    let success: Bool
    let data: SubscriptionDataDTO
}

struct SubscriptionDataDTO: Decodable {

    let isPremium: Bool
    let expiresAt: String?
}
