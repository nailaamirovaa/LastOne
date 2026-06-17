//
//  Trigger.swift
//  LastOne
//
//  Created by Naila Amirova on 04.06.26.
//

struct Trigger: Decodable {
    let id, name: String
    let isDefault: Bool
    let userId: String?
}
