//
//  ListTriggersResponseDTO.swift
//  LastOne
//
//  Created by Naila Amirova on 03.06.26.
//

import Foundation

// MARK: - Response
struct ListTriggersResponseDTO: Decodable {
    let success: Bool
    let data: ListTriggersDataDTO
}

// MARK: - Data
struct ListTriggersDataDTO: Decodable {
    let triggers: [Trigger]
}
