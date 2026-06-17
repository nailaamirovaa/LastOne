//
//  OnboardingView 2.swift
//  LastOne
//
//  Created by Naila Amirova on 12.06.26.
//

import SwiftUI

struct OnboardingView: View {
    
    @EnvironmentObject private var coordinator: AppCoordinator
    @StateObject private var viewModel: OnboardingViewModel
    
    init(setupProfileUseCase: SetupProfileUseCase) {
        
        _viewModel = StateObject(wrappedValue: OnboardingViewModel(setupProfileUseCase: setupProfileUseCase))
    }
    
    var body: some View {
        ZStack {
            switch viewModel.step {
            case 1:
                OnboardingStep1View(
                    viewModel: viewModel)
            case 2:
                OnboardingStep2View(
                    viewModel: viewModel)
            case 3:
                OnboardingStep3View(
                    viewModel: viewModel)
            default:
                EmptyView()
            }
        }
        .alert(
            "Error",
            isPresented: Binding(
                get: {
                    viewModel.errorMessage != nil
                },
                set: { _ in
                    viewModel.errorMessage = nil
                }
            )
        ) {
            
            Button("OK") { }
            
        } message: {
            
            Text(viewModel.errorMessage ?? "")
        }
        .onChange(of: viewModel.isCompleted) { _, isCompleted in

            if isCompleted {
                coordinator.route = .main
            }
        }
    }
}
