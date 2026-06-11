//
//  CigaretteLogsEndpoint.swift
//  LastOne
//
//  Created by Naila Amirova on 03.06.26.
//

import Foundation

enum CigaretteLogsRequest: APIRequest {
    
    case logCigarette(LogCigaretteRequestDTO)
    case todaysLogs
    case weekLogs
    case deleteLog(id: String)
    
    var path: String {

        switch self {
        case .logCigarette:
            return "/logs"
        case .todaysLogs:
            return "/logs/today"
        case .weekLogs:
            return "/logs/week"
        case .deleteLog(let id):
            return "/logs/\(id)"
        }
    }
    
    var method: HTTPMethod {

        switch self {
        case .logCigarette:
            return .post
        case .todaysLogs, .weekLogs:
            return .get
        case .deleteLog:
            return .delete
        }
    }
    
    var body: Data? {

        switch self {
        case .logCigarette(let request):
            return try? JSONEncoder().encode(request)
        case .todaysLogs, .weekLogs , .deleteLog:
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
