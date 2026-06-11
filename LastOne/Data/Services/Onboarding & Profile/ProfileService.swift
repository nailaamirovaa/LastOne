//
//  ProfileService.swift
//  LastOne
//
//  Created by Naila Amirova on 03.06.26.
//


import Foundation

public final class ProfileService {

    private let networkManager = NetworkManager.shared

    // MARK: - Setup Profile
    func setupProfile(request: SetupProfileRequestDTO) async throws -> SetupProfileDataDTO {
        try await networkManager.requestWrapped(
            ProfileRequest.setupProfile(request),
            responseType: SetupProfileDataDTO.self
        )
    }

    // MARK: - Get Profile
    func getProfile()async throws -> GetProfileDataDTO {
        try await networkManager.requestWrapped(
            ProfileRequest.getProfile,
            responseType: GetProfileDataDTO.self
        )
    }

    // MARK: - Update Profile
    func updateProfile(request: UpdateProfileRequestDTO) async throws -> UpdateProfileDataDTO {
        try await networkManager.requestWrapped(
            ProfileRequest.updateProfile(request),
            responseType:UpdateProfileDataDTO.self
        )
    }
}
