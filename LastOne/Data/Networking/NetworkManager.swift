//
//  NetworkManager.swift
//  LastOne
//
//  Created by Naila Amirova on 03.06.26.
//


// NetworkManager.swift

import Foundation

final class NetworkManager: Sendable {
    static let shared = NetworkManager()
    private init() {}

    // MARK: - Base Request
    
    func request<T: Decodable>(
        _ endpoint: Endpoint,
        responseType: T.Type
    ) async throws -> T {

        var components = URLComponents(string: NetworkingHelper.baseURL + endpoint.path)
        components?.queryItems = endpoint.queryItems

        guard let url = components?.url else {
            throw NetworkError.invalidURL
        }

        var request = URLRequest(url: url)
        request.httpMethod = endpoint.method.rawValue
        request.httpBody = endpoint.body

        NetworkingHelper.defaultHeaders.forEach {
            request.setValue($1, forHTTPHeaderField: $0)
        }
        endpoint.headers?.forEach {
            request.setValue($1, forHTTPHeaderField: $0)
        }

        let (data, response) = try await URLSession.shared.data(for: request)

        guard let httpResponse = response as? HTTPURLResponse else {
            throw NetworkError.invalidResponse
        }
        
        guard 200...299 ~= httpResponse.statusCode else {
            if let apiError = try? JSONDecoder().decode(APIError.self, from: data) {
                throw NetworkError.apiError(apiError.error ?? "Server error")
            }
            throw NetworkError.serverError(httpResponse.statusCode)
        }
        
        do {
            return try JSONDecoder().decode(T.self, from: data)
        } catch {
            throw NetworkError.decodingError
        }
    }

    // MARK: - Wrapped Request (APIResponse<T>)
    
    func requestWrapped<T: Decodable>(
        _ endpoint: Endpoint,
        responseType: T.Type
    ) async throws -> T {

        let response: APIResponse<T> = try await request(
            endpoint,
            responseType: APIResponse<T>.self
        )

        if response.success, let result = response.data {
            return result
        } else {
            throw NetworkError.apiError("Request failed")
        }
    }
    
    
    // MARK: -  Request Data
    
    func requestData(
        _ endpoint: Endpoint
    ) async throws -> Data {

        var components = URLComponents(
            string: NetworkingHelper.baseURL + endpoint.path
        )

        components?.queryItems = endpoint.queryItems

        guard let url = components?.url else {
            throw NetworkError.invalidURL
        }

        var request = URLRequest(url: url)

        request.httpMethod = endpoint.method.rawValue
        request.httpBody = endpoint.body

        NetworkingHelper.defaultHeaders.forEach {
            request.setValue($1, forHTTPHeaderField: $0)
        }

        endpoint.headers?.forEach {
            request.setValue($1, forHTTPHeaderField: $0)
        }

        let (data, response) = try await URLSession.shared.data(
            for: request
        )

        guard let httpResponse = response as? HTTPURLResponse else {
            throw NetworkError.invalidResponse
        }

        guard 200...299 ~= httpResponse.statusCode else {
            throw NetworkError.serverError(
                httpResponse.statusCode
            )
        }

        return data
    }
}
