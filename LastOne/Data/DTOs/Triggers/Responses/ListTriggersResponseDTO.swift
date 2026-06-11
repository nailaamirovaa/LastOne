//
//  ListTriggersResponseDTO.swift
//  LastOne
//
//  Created by Naila Amirova on 03.06.26.
//

import Foundation

// MARK: - Data
struct ListTriggersDataDTO: Decodable {
    let triggers: [TriggerDTO]?
}
