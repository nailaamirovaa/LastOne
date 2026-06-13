//
//  RootView.swift
//  LastOne
//
//  Created by Naila Amirova on 11.06.26.
//

import Foundation
import SwiftUI

struct RootView: View {

    @EnvironmentObject var coordinator: AppCoordinator

    var body: some View {

        switch coordinator.route {
        case .login:
            LoginView(loginUseCase: LoginUseCaseImpl(repository: AuthRepositoryImpl(service: AuthService())))
        case .register:
            RegisterView(registerUseCase: RegisterUseCaseImpl(repository: AuthRepositoryImpl(service: AuthService())))
        case .onboarding:
            OnboardingView(setupProfileUseCase: SetupProfileUseCaseImpl(repository: UserRepositoryImpl(service: ProfileService())))
        case .main:
            MainTabView()
        }
    }
}
