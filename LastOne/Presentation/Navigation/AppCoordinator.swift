//
//  AppCoordinator.swift
//  LastOne
//
//  Created by Naila Amirova on 11.06.26.
//

import Foundation
import Combine


@MainActor
final class AppCoordinator: ObservableObject {

    @Published var route: Route
    private var cancellables = Set<AnyCancellable>()

    init() {
        self.route = .splash
        
        setupBindings()
        restoreSession()
    }

    enum Route {
        case splash
        case login
        case register
        case onboarding
        case main
    }
    
    private func setupBindings() {
        AuthSessionManager.shared.$isAuthenticated
            .receive(on: RunLoop.main)
            .sink { [weak self] isAuthenticated in
                if !isAuthenticated {
                    self?.route = .login
                }
            }
            .store(in: &cancellables)
    }
    
    private func restoreSession() {
        Task {
        
            let startTime = Date()
            
            let isValid = await AuthSessionManager.shared.restoreSession()
            
            let elapsed = Date().timeIntervalSince(startTime)
            let remaining = max(0, 1.5 - elapsed)
            
            if remaining > 0 {
                try? await Task.sleep(nanoseconds: UInt64(remaining * 1_000_000_000))
            }
            
            route = isValid ? .main : .login
        }
    }
}
