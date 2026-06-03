//
//  RefreshTokenDataDTO.swift
//  LastOne
//
//  Created by Naila Amirova on 03.06.26.
//


import Foundation

struct RefreshTokenDataDTO: Decodable {
    let accessToken: String
    let refreshToken: String
}
