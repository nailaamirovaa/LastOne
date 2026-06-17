//
//  AuthRepositoryImpl.swift
//  LastOne
//
//  Created by Naila Amirova on 11.06.26.
//

import Foundation


final class AuthRepositoryImpl: AuthRepository {

    private let service: AuthService

    init(service: AuthService) {
        self.service = service
    }

    // MARK: - Register
    func register( email: String, password: String) async throws -> User {

        let dto = try await service.register(
            request: RegisterRequestDTO(
                email: email,
                password: password,
            )
        )
        
        guard let user = dto.user else {
            throw NetworkError.invalidResponse
        }
        
        UserDefaults.standard.set(dto.accessToken,
                                  forKey: "accessToken")

        UserDefaults.standard.set(dto.refreshToken,
                                  forKey: "refreshToken")
        
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
        
        UserDefaults.standard.set(dto.accessToken,
                                  forKey: "accessToken")

        UserDefaults.standard.set(dto.refreshToken,
                                  forKey: "refreshToken")
        
        return user.toEntity()
    }

    // MARK: - Logout
    func logout(request: TokenRequestDTO) async throws {

        try await service.logout(request: request)
    }
}
