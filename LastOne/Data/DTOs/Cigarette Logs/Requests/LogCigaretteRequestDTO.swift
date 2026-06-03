//
//  LogCigaretteRequestDTO.swift
//  LastOne
//
//  Created by Naila Amirova on 03.06.26.
//

import Foundation

struct LogCigaretteRequestDTO: Encodable {
    let smokedAt: Date
    let note, triggerID: String

    enum CodingKeys: String, CodingKey {
        case smokedAt, note
        case triggerID = "triggerId"
    }
}
