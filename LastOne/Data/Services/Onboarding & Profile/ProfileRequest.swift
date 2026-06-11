//
//  ProfileEndpoint.swift
//  LastOne
//
//  Created by Naila Amirova on 03.06.26.
//


import Foundation

enum ProfileRequest: APIRequest {

    case setupProfile(SetupProfileRequestDTO)
    case getProfile
    case updateProfile(UpdateProfileRequestDTO)

    var path: String {

        switch self {
        case .setupProfile:
            return "/profile/setup"
        case .getProfile:
            return "/profile"
        case .updateProfile:
            return "/profile"
        }
    }
    
    var method: HTTPMethod {

        switch self {
        case .setupProfile:
            return .post
        case .getProfile:
            return .get
        case .updateProfile:
            return .put
        }
    }
    
    var body: Data? {

        switch self {
        case .setupProfile(let request):
            return try? JSONEncoder().encode(request)
        case .updateProfile(let request):
            return try? JSONEncoder().encode(request)
        case .getProfile:
            return nil
        }
    }
    
    var headers: [String : String]? {
        nil
    }

    var queryItems: [URLQueryItem]? {
        nil
    }
}
