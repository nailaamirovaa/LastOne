//
//  LogCigaretteResponseDTO.swift
//  LastOne
//
//  Created by Naila Amirova on 03.06.26.
//

import Foundation

// MARK: - Response
struct LogCigaretteResponseDTO: Decodable {
    let success: Bool
    let data: LogCigaretteDataDTO
}

// MARK: - Data
struct LogCigaretteDataDTO: Decodable {
    let log: LogDTO
}


