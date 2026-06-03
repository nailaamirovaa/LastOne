//
//  Log.swift
//  LastOne
//
//  Created by Naila Amirova on 03.06.26.
//


// MARK: - Log
struct Log: Decodable {
    let id, userID, smokedAt, note: String
    let triggerID: String
    let trigger: Trigger
    let createdAt: String

    enum CodingKeys: String, CodingKey {
        case id
        case userID = "userId"
        case smokedAt, note
        case triggerID = "triggerId"
        case trigger, createdAt
    }
}
