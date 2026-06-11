//
//  Trigger.swift
//  LastOne
//
//  Created by Naila Amirova on 03.06.26.
//


// MARK: - Trigger
struct TriggerDTO: Decodable {
    let id, name: String?
    let isDefault: Bool?
    let userId: String?
}
