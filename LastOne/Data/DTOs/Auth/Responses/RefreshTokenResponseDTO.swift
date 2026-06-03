//
//  RefreshTokenResponseDTO.swift
//  LastOne
//
//  Created by Naila Amirova on 03.06.26.
//


import Foundation

struct RefreshTokenResponseDTO : Decodable {
    let success: Bool
    let data: RefreshTokenDataDTO
}
