//
//  AuthError.swift
//  LastOne
//
//  Created by Naila Amirova on 24.06.26.
//


enum AuthError: String {
    case invalidCredentials = "INVALID_CREDENTIALS"
    case emailExists = "EMAIL_EXISTS"
    case invalidToken = "INVALID_TOKEN"
    case tokenExpired = "TOKEN_EXPIRED"
}

extension AuthError {

    var localizedKey: String {
        switch self {
        case .invalidCredentials:
            return "invalid_credentials"
        case .emailExists:
            return "email_exists"
        case .invalidToken:
            return "invalid_token"
        case .tokenExpired:
            return "token_expired"
        }
    }
}
