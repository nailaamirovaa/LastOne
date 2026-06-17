//
//  NetworkingHelper.swift
//  LastOne
//
//  Created by Naila Amirova on 03.06.26.
//

enum NetworkingHelper {
    
    static let baseURL = "https://lastonebackend-production-36b9.up.railway.app"
    
    static let defaultHeaders: [String: String] = [
        "Content-Type": "application/json",
        "Accept":       "application/json"
    ]
}
