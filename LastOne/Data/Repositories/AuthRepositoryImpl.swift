//
//  AuthRepositoryImpl.swift
//  LastOne
//
//  Created by Naila Amirova on 11.06.26.
//

import Foundation


final class AuthRepositoryImpl: AuthRepository {

    private let service: AuthService
    private let sessionManager: AuthSessionManager

    init(service: AuthService, sessionManager: AuthSessionManager = .shared) {
        self.service = service
        self.sessionManager = sessionManager
    }

    // MARK: - Register
    func register( email: String, password: String) async throws -> User {

        let dto = try await service.register(
            request: RegisterRequestDTO(
                email: email,
                password: password
            )
        )
        
        guard let user = dto.user else {
            throw NetworkError.invalidResponse
        }
        
        sessionManager.saveSession(accessToken: dto.accessToken ?? "", 
                                   refreshToken: dto.refreshToken ?? "")
        
        return user.toEntity()
    }

    // MARK: - Login
    func login(email: String, password: String) async throws -> User {

        let dto = try await service.login(
            request: LoginRequestDTO(
                email: email,
                password: password
            )
        )

        guard let user = dto.user else {
            throw NetworkError.invalidResponse
        }
        
        sessionManager.saveSession(accessToken: dto.accessToken ?? "", 
                                   refreshToken: dto.refreshToken ?? "")
        
        return user.toEntity()
    }

    // MARK: - Refresh
    func refresh(token: String) async throws -> RefreshTokenDataDTO {
        let dto = try await service.refreshToken(request: TokenRequestDTO(refreshToken: token))
        return dto
    }

    // MARK: - Logout
    func logout(request: TokenRequestDTO) async throws {
        try await service.logout(request: request)
        sessionManager.logout()
    }
}
