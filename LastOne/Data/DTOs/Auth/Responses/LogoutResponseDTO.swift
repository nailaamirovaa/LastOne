//
//  LogoutResponseDTO.swift
//  LastOne
//
//  Created by Naila Amirova on 03.06.26.
//

struct LogoutResponseDTO: Decodable {
    let success: Bool
    let data: LogoutDataDTO
}
