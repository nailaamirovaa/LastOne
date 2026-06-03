//
//  DeleteLogResponseDTO.swift
//  LastOne
//
//  Created by Naila Amirova on 03.06.26.
//

import Foundation

// MARK: - Response
struct DeleteLogResponseDTO: Decodable {
    let success: Bool
    let data: DeleteLogDataDTO
}

// MARK: - Data
struct DeleteLogDataDTO: Decodable {
    let message: String
}
