//
//  LogoutResponseDTO.swift
//  LastOne
//
//  Created by Naila Amirova on 03.06.26.
//

// MARK: - Response
struct LogoutResponseDTO: Decodable {
    let success: Bool
    let data: LogoutDataDTO
}

// MARK: - Data

struct LogoutDataDTO: Decodable {
    let message: String
}
