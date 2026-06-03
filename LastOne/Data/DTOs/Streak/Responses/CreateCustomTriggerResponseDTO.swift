//
//  CreateCustomTriggerResponseDTO.swift
//  LastOne
//
//  Created by Naila Amirova on 03.06.26.
//


import Foundation

// MARK: - Response
struct CreateCustomTriggerResponseDTO: Decodable {
    let success: Bool
    let data: CreateCustomTriggerDataDTO
}

// MARK: - DataClass
struct CreateCustomTriggerDataDTO: Decodable {
    let trigger: Trigger
}
