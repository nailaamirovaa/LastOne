//
//  Endpoint.swift
//  LastOne
//
//  Created by Naila Amirova on 03.06.26.
//

import Foundation

protocol Endpoint {
    var path: String { get }
    var method: HTTPMethod { get }
    var headers: [String: String]? { get }
    var queryItems: [URLQueryItem]? { get }
    var body: Data? { get }
}
