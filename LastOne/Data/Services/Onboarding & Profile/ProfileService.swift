//
//  ProfileService.swift
//  LastOne
//
//  Created by Naila Amirova on 03.06.26.
//


import Foundation

public final class ProfileService {

    private let networkManager =
        NetworkManager.shared

    // MARK: - Setup Profile

    func setupProfile(
        request: SetupProfileRequestDTO
    ) async throws -> SetupProfileResponseDTO {

        try await networkManager.request(

            ProfileEndpoint.setupProfile(request),

            responseType:
                SetupProfileResponseDTO.self
        )
    }

    // MARK: - Get Profile

    func getProfile()
    async throws -> GetProfileResponseDTO {

        try await networkManager.request(

            ProfileEndpoint.getProfile,

            responseType:
                GetProfileResponseDTO.self
        )
    }

    // MARK: - Update Profile

    func updateProfile(
        request: UpdateProfileRequestDTO
    ) async throws -> UpdateProfileResponseDTO {

        try await networkManager.request(

            ProfileEndpoint.updateProfile(request),

            responseType:
                UpdateProfileResponseDTO.self
        )
    }
}
