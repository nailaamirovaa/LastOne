//
//  AuthService.swift
//  LastOne
//
//  Created by Naila Amirova on 03.06.26.
//


import Foundation

public final class AuthService {

    private let networkManager =
        NetworkManager.shared

    // MARK: - Register

    func register(
        request: RegisterRequestDTO
    ) async throws -> AuthResponseDTO {

        try await networkManager.request(
            AuthEndpoint.register(request),
            responseType:AuthResponseDTO.self
        )
    }

    // MARK: - Login

    func login(
        request: LoginRequestDTO
    ) async throws -> AuthResponseDTO {

        try await networkManager.request(
            AuthEndpoint.login(request),
            responseType:AuthResponseDTO.self
        )
    }

    // MARK: - Refresh Token

    func refreshToken(
        request: TokenRequestDTO
    ) async throws -> RefreshTokenResponseDTO {

        try await networkManager.request(
            AuthEndpoint.refreshToken(request),
            responseType:
                RefreshTokenResponseDTO.self
        )
    }

    // MARK: - Logout

    func logout(
        request: TokenRequestDTO
    ) async throws -> LogoutResponseDTO {

        try await networkManager.request(
            AuthEndpoint.logout(request),
            responseType:LogoutResponseDTO.self
        )
    }
}
