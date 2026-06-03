//
//  RevenueCatWebhookRequestDTO.swift
//  LastOne
//
//  Created by Naila Amirova on 03.06.26.
//

import Foundation

// MARK: - Welcome
struct RevenueCatWebhookRequestDTO: Encodable {
    let event: Event
}

// MARK: - Event
struct Event: Encodable {
    let type, appUserID, productID: String
    let expirationAtMS, purchasedAtMS: Int

    enum CodingKeys: String, CodingKey {
        case type
        case appUserID = "app_user_id"
        case productID = "product_id"
        case expirationAtMS = "expiration_at_ms"
        case purchasedAtMS = "purchased_at_ms"
    }
}
