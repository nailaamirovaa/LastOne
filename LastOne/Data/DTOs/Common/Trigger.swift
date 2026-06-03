//
//  Trigger.swift
//  LastOne
//
//  Created by Naila Amirova on 03.06.26.
//


// MARK: - Trigger
struct Trigger: Decodable {
    let id, name: String
    let isDefault: Bool
    let userID: String?
    
    enum CodingKeys: String, CodingKey {
        case id, name, isDefault
        case userID = "userId"
    }
}
