//
//  ProfileViewModel.swift
//  LastOne
//
//  Created by Naila Amirova on 17.06.26.
//


import Foundation
import Combine

@MainActor
final class ProfileViewModel: ObservableObject {

    // MARK: - Published Properties

    @Published var startingGoal: Int = 0
    @Published var joinDate: String = "-"
    @Published var reductionPace: String = "-"
    @Published var profile: UserProfile?
    @Published var refreshToken: String = ""

    @Published var isLoading = false
    @Published var errorMessage: String?

    // MARK: - Dependencies

    private let getProfileUseCase: GetProfileUseCase
    private let logoutUseCase: LogoutUseCase

    // MARK: - Init

    init(getProfileUseCase: GetProfileUseCase, logoutUseCase: LogoutUseCase) {
        self.getProfileUseCase = getProfileUseCase
        self.logoutUseCase = logoutUseCase
    }

    // MARK: - Load

    func load() {

        Task {

            isLoading = true
            errorMessage = nil

            defer {
                isLoading = false
            }

            do {

                profile = try await getProfileUseCase.execute()

                startingGoal = profile?.profile.dailyGoalStart ?? 0
                reductionPace = String(profile?.profile.reductionPaceWeeks ?? 0)

                let formatter = DateFormatter()
                formatter.dateFormat = "dd.MM.yyyy"

                joinDate = formatter.string(from:UserDefaults.standard.object(forKey: "joinDate") as! Date)
                
                refreshToken = AuthSessionManager.shared.refreshToken ?? ""
            } catch {
                
                errorMessage = error.localizedDescription
            }
        }
    }
    
    // MARK: - Logout
    
    func logout() {
        
        Task {
            
            do {
                
                UserDefaults.standard.removeObject(
                    forKey: "accessToken"
                )
                
                UserDefaults.standard.removeObject(
                    forKey: "refreshToken"
                )
                
                try await logoutUseCase.execute(request: TokenRequestDTO(refreshToken: refreshToken))
                
            } catch {
                
                errorMessage = error.localizedDescription
            }
        }
    }
}
