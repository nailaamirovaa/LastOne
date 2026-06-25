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
    @Published var endingGoal: Int = 0
    @Published var currentGoal: Int = 0
    @Published var reductionWeeks: Int = 0
    @Published var joinDate: String = "-"
    @Published var reductionPace: String = "-"
    @Published var profile: UserProfile?
    @Published var refreshToken: String = ""

    @Published var isLoading = false
    @Published var errorMessage: String?
    @Published var hasData: Bool = false

    // MARK: - Dependencies

    private let getProfileUseCase: GetProfileUseCase
    private let updateProfileUseCase: UpdateProfileUseCase
    private let logoutUseCase: LogoutUseCase

    // MARK: - Init

    init(getProfileUseCase: GetProfileUseCase, updateProfileUseCase: UpdateProfileUseCase, logoutUseCase: LogoutUseCase) {
        self.getProfileUseCase = getProfileUseCase
        self.updateProfileUseCase = updateProfileUseCase
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
                endingGoal = profile?.profile.dailyGoalFinal ?? 0
                currentGoal = profile?.profile.dailyGoalCurrent ?? 0
                reductionPace = String(profile?.profile.reductionPaceWeeks ?? 0)
                reductionWeeks = profile?.profile.reductionPaceWeeks ?? 0
                
                let formatter = DateFormatter()
                formatter.dateFormat = "dd.MM.yyyy"
                
                if let joinDateValue = UserDefaults.standard.object(forKey: "joinDate") as? Date {
                    joinDate = formatter.string(from: joinDateValue)
                } else {
                    joinDate = "-"
                }
                
                refreshToken = AuthSessionManager.shared.refreshToken ?? ""
                
                
                hasData = profile != nil
                
                
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
    
    // MARK: - Update Profile
    
    func updateProfile(endingGoal: Int, reductionWeeks: Int) {

        Task {

            do {

                try await updateProfileUseCase.execute(
                    dailyGoalFinal: endingGoal,
                    reductionPaceWeeks: reductionWeeks,
                    timezone: TimeZone.current.identifier
                )

                load()

            } catch {

                errorMessage =
                    error.localizedDescription
            }
        }
    }
}
