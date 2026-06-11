//
//  AuthRepository.swift
//  LastOne
//
//  Created by Naila Amirova on 11.06.26.
//


protocol AuthRepository {

    func register(email: String, password: String) async throws -> User

    func login(email: String, password: String) async throws -> User

    func logout(request: TokenRequestDTO) async throws
}
