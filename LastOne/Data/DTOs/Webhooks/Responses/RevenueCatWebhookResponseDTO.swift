//
//  RevenueCatWebhookResponseDTO.swift
//  LastOne
//
//  Created by Naila Amirova on 03.06.26.
//

import Foundation

// MARK: - Welcome
struct RevenueCatWebhookResponseDTO: Decodable {
    let success: Bool
    let data: RevenueCatWebhookDataDTO
}

// MARK: - Data
struct RevenueCatWebhookDataDTO: Decodable {
    let received: Bool
}
