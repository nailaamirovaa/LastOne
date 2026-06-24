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
        case .splash:
            SplashView()
        case .login:
            LoginView(loginUseCase: LoginUseCaseImpl(repository: AuthRepositoryImpl(service: AuthService())))
        case .register:
            RegisterView(registerUseCase: RegisterUseCaseImpl(repository: AuthRepositoryImpl(service: AuthService())))
        case .onboarding:
            OnboardingView(setupProfileUseCase: SetupProfileUseCaseImpl(repository: UserRepositoryImpl(service: ProfileService())))
        case .main:
            MainTabView()
        case .forgotPassword:
            ForgotPasswordView(forgotPasswordUseCase: ForgotPasswordUseCaseImpl(repository: AuthRepositoryImpl(service: AuthService())))
        case .resetPassword(token: let token):
            ResetPasswordView(token: token, resetPasswordUseCase: ResetPasswordUseCaseImpl(repository: AuthRepositoryImpl(service: AuthService())))
        }
    }
}
