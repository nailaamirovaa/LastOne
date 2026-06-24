//
//  ResetPasswordRequestDTO.swift
//  LastOne
//
//  Created by Naila Amirova on 24.06.26.
//


struct ResetPasswordRequestDTO: Encodable {
    let token: String
    let password: String
}
