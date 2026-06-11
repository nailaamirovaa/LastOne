//
//  Log.swift
//  LastOne
//
//  Created by Naila Amirova on 03.06.26.
//


// MARK: - Log
struct LogDTO: Decodable {
    let id, userId, smokedAt, note: String?
    let triggerId: String?
    let trigger: TriggerDTO?
    let createdAt: String?
}
