//
//  LogCigaretteRequestDTO.swift
//  LastOne
//
//  Created by Naila Amirova on 03.06.26.
//

import Foundation

struct LogCigaretteRequestDTO: Encodable {
    let smokedAt: String
    let note, triggerId: String
}
