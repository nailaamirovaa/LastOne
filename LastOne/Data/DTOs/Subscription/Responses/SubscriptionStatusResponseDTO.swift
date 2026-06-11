//
//  SubscriptionStatusResponseDTO.swift
//  LastOne
//
//  Created by Naila Amirova on 03.06.26.
//

import Foundation

// MARK: - Data
struct SubscriptionStatusDataDTO: Decodable {
    let plan, expiresAt, revenueCatUserId: String?
}
