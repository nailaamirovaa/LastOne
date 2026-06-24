//
//  AuthService.swift
//  LastOne
//
//  Created by Naila Amirova on 03.06.26.
//


import Foundation

public final class AuthService {

    private let networkManager = NetworkManager.shared

    // MARK: - Register
    func register(request: RegisterRequestDTO) async throws -> AuthDataDTO {

        try await networkManager.requestWrapped(
            AuthRequest.register(request),
            responseType:AuthDataDTO.self
        )
    }

    // MARK: - Login
    func login( request: LoginRequestDTO) async throws -> AuthDataDTO {

        try await networkManager.requestWrapped(
            AuthRequest.login(request),
            responseType:AuthDataDTO.self
        )
    }

    // MARK: - Refresh Token
    func refreshToken(request: TokenRequestDTO) async throws -> RefreshTokenDataDTO {

        try await networkManager.requestWrapped(
            AuthRequest.refreshToken(request),
            responseType: RefreshTokenDataDTO.self
        )
    }

    // MARK: - Logout
    func logout(request: TokenRequestDTO) async throws -> LogoutDataDTO {

        try await networkManager.requestWrapped(
            AuthRequest.logout(request),
            responseType:LogoutDataDTO.self
        )
    }
    
    // MARK: - Forgot Password
    func forgotPassword(email: String) async throws {
        
        _ = try await networkManager.requestWrapped(
            AuthRequest.forgotPassword(ForgotPasswordRequestDTO(email: email)),
            responseType: ForgotPasswordResponseDTO.self
        )
    }
    
    // MARK: - Reset Password
    func resetPassword(token: String,password: String) async throws {

        _ = try await networkManager.requestWrapped(
            AuthRequest.resetPassword(ResetPasswordRequestDTO(token: token,password: password)),
            responseType: ResetPasswordResponseDTO.self
        )
    }
}
