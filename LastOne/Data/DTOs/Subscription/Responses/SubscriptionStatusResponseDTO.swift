//
//  SubscriptionStatusResponseDTO.swift
//  LastOne
//
//  Created by Naila Amirova on 03.06.26.
//

import Foundation

// MARK: - Response
struct SubscriptionStatusResponseDTO: Decodable {
    let success: Bool
    let data: SubscriptionStatusDataDTO
}

// MARK: - Data
struct SubscriptionStatusDataDTO: Decodable {
    let plan, expiresAt, revenueCatUserID: String

    enum CodingKeys: String, CodingKey {
        case plan, expiresAt
        case revenueCatUserID = "revenueCatUserId"
    }
}
