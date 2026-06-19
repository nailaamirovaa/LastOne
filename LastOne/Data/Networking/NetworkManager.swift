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
        _ apiRequest: APIRequest,
        responseType: T.Type,
        isRetry: Bool = false
    ) async throws -> T {

        var components = URLComponents(string: NetworkingHelper.baseURL + apiRequest.path)
        components?.queryItems = apiRequest.queryItems

        guard let url = components?.url else {
            throw NetworkError.invalidURL
        }

        var request = URLRequest(url: url)
        request.httpMethod = apiRequest.method.rawValue
        request.httpBody = apiRequest.body
        
        if let token = AuthSessionManager.shared.accessToken {
            request.setValue("Bearer \(token)",
                             forHTTPHeaderField: "Authorization")
        }

        NetworkingHelper.defaultHeaders.forEach {
            request.setValue($1, forHTTPHeaderField: $0)
        }
        apiRequest.headers?.forEach {
            request.setValue($1, forHTTPHeaderField: $0)
        }

        let (data, response) = try await URLSession.shared.data(for: request)

        guard let httpResponse = response as? HTTPURLResponse else {
            throw NetworkError.invalidResponse
        }
        
        // Handle 401 Unauthorized
        if httpResponse.statusCode == 401 && !isRetry {
            let refreshSuccess = await AuthSessionManager.shared.refreshSession()
            if refreshSuccess {
                // Retry the request exactly once with new token
                return try await self.request(apiRequest, responseType: responseType, isRetry: true)
            } else {
                // Refresh failed, logout is already called inside refreshSession()
                throw NetworkError.serverError(401)
            }
        }
        
        guard 200...299 ~= httpResponse.statusCode else {
            if let apiError = try? JSONDecoder().decode(APIError.self, from: data) {
                throw NetworkError.apiError(message: apiError.error ?? "Server error",
                                             code: apiError.code)
            }
            throw NetworkError.serverError(httpResponse.statusCode)
        }
        
        do {
            return try JSONDecoder().decode(T.self, from: data)
        } catch {
            
            print("RAW JSON:")
            print(String(data: data, encoding: .utf8) ?? "")
            
            print("DECODING ERROR:")
            print(error)
            
            throw NetworkError.decodingError
        }
    }

    // MARK: - Wrapped Request (APIResponse<T>)
    
    func requestWrapped<T: Decodable>(
        _ endpoint: APIRequest,
        responseType: T.Type
    ) async throws -> T {
        
        let response: APIResponse<T> = try await request(
            endpoint,
            responseType: APIResponse<T>.self
        )
        /*
        if endpoint.path == "/stats/weekly"{
            print(String(data: response.data as! Data, encoding: .utf8) ?? "")
        }
         */

        if response.success, let result = response.data {
            return result
        } else {
            throw NetworkError.apiError(message: "Request failed", code: "")
        }
    }
    
    
    // MARK: -  Request Data
    
    func requestData(
        _ endpoint: APIRequest
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
