//
//  AuthEndpoint.swift
//  LastOne
//
//  Created by Naila Amirova on 03.06.26.
//


import Foundation

enum AuthRequest: APIRequest {
    case register(RegisterRequestDTO)
    case login(LoginRequestDTO)
    case refreshToken(TokenRequestDTO)
    case logout(TokenRequestDTO)
    case forgotPassword(ForgotPasswordRequestDTO)
    case resetPassword(ResetPasswordRequestDTO)
    
    var path: String {
        switch self {
        case .register:
            return "/auth/register"
        case .login:
            return "/auth/login"
        case .refreshToken:
            return "/auth/refresh"
        case .logout:
            return "/auth/logout"
        case .forgotPassword:
            return "/auth/forgot-password"
        case .resetPassword:
            return "/auth/reset-password"
        }
    }
    
    var method: HTTPMethod {

        switch self {
        case .register,
             .login,
             .refreshToken,
             .logout,
             .forgotPassword,
             .resetPassword:

            return .post
        }
    }
    
    var body: Data? {
        switch self {
        case .register(let request):
            return try? JSONEncoder().encode(request)
        case .login(let request):
            return try? JSONEncoder().encode(request)
        case .refreshToken(let request):
            return try? JSONEncoder().encode(request)
        case .logout(let request):
            return try? JSONEncoder().encode(request)
        case .forgotPassword(let request):
            return try? JSONEncoder().encode(request)
        case .resetPassword(let request):
            return try? JSONEncoder().encode(request)
        }
    }
    
    var queryItems: [URLQueryItem]? {
        nil
    }
    
    var headers: [String : String]? {
        nil
    }
}
