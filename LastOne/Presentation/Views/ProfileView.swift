//
//  ProfileView.swift
//  LastOne
//
//  Created by Naila Amirova on 09.06.26.
//

import SwiftUI

struct ProfileView: View {
    
    @EnvironmentObject private var coordinator: AppCoordinator
    @EnvironmentObject private var languageManager: LanguageManager
    @StateObject private var viewModel: ProfileViewModel
    
    @State private var showEditPlan = false
    
    init(getProfileUseCase: GetProfileUseCase, updateProfileUseCase: UpdateProfileUseCase,logoutUseCase: LogoutUseCase) {

        _viewModel = StateObject(
            wrappedValue: ProfileViewModel(
                getProfileUseCase: getProfileUseCase,
                updateProfileUseCase: updateProfileUseCase,
                logoutUseCase: logoutUseCase
            )
        )
    }
    
    var body: some View {
        ZStack {
            VStack(alignment: .leading, spacing: 32) {
                Text("Settings")
                    .font(.display)
                    .foregroundStyle(.primaryText)
                
                if viewModel.isLoading {
                    LoadingView()
                } else if let error = viewModel.errorMessage {
                    ErrorView(message: error){
                        viewModel.load()
                    }
                } else if !viewModel.hasData {
                    EmptyView()
                } else {
                    contentView
                }
            
                Spacer()
            }
            .padding(.horizontal, 24)
            .padding(.top, 30)
        }
        .onAppear(){
            viewModel.load()
        }
        .background(Color.appBackground.ignoresSafeArea())
    }
    
    var contentView: some View {
        VStack(alignment: .leading, spacing: 32) {
            settingsSection
            planSection
            dangerZone
        }
    }
    
    private var settingsSection: some View {
        VStack(alignment: .leading, spacing: 16) {
            Text("Your Profile")
                .font(.headline)
                .foregroundStyle(.secondaryText)
            
            VStack(spacing: 0) {
                Button {
                    showEditPlan = true
                } label: {

                    HStack {
                        Text("Starting Goal")
                            .foregroundStyle(.tertiaryText)

                        Spacer()

                        Text("\(viewModel.startingGoal)")
                            .foregroundStyle(.secondaryText)

                        Image(systemName: "chevron.right")
                            .font(.caption)
                            .foregroundStyle(.tertiaryText)
                    }
                    .padding()
                }
                
                Divider().background(Color.hairline).padding(.horizontal)
                
                Button {
                    showEditPlan = true
                } label: {

                    HStack {
                        Text("Ending Goal")
                            .foregroundStyle(.tertiaryText)

                        Spacer()

                        Text("\(viewModel.endingGoal)")
                            .foregroundStyle(.secondaryText)

                        Image(systemName: "chevron.right")
                            .font(.caption)
                            .foregroundStyle(.tertiaryText)
                    }
                    .padding()
                }
                
                Divider().background(Color.hairline).padding(.horizontal)
                
                HStack {
                    Text("Join Date")
                        .foregroundStyle(.tertiaryText)
                    Spacer()
                    Text(viewModel.joinDate)
                        .foregroundStyle(.secondaryText)
                }
                .padding()
            }
            .background(Color.surface)
            .cornerRadius(AppRadius.lg)
        }
        .sheet(isPresented: $showEditPlan) {

            EditPlanSheet(
                startingGoal: viewModel.startingGoal,
                endingGoal: viewModel.endingGoal,
                reductionWeeks: viewModel.reductionWeeks
            ) {  end, weeks in

                viewModel.updateProfile(
                    endingGoal: end,
                    reductionWeeks: weeks
                )
            }
        }
    }
    
    private var planSection: some View {
        VStack(alignment: .leading, spacing: 16) {
            Text("Reduction Plan")
                .font(.headline)
                .foregroundStyle(.secondaryText)
            
            VStack(spacing: 0) {
                HStack {
                    Text("Reduction Pace")
                        .foregroundStyle(.tertiaryText)
                    Spacer()
                    Text("Moderate")
                        .foregroundStyle(.secondaryText)
                }
                .padding()
            }
            .background(Color.surface)
            .cornerRadius(AppRadius.lg)
        }
    }
    
    private var dangerZone: some View {
        VStack(alignment: .leading, spacing: 16) {
            Text("Danger Zone")
                .font(.headline)
                .foregroundStyle(.error)
            
            Button {
                viewModel.logout()
                coordinator.route = .login
            } label: {
                HStack {
                    Image(systemName: "door.left.hand.open")
                    Text("Logout")
                    Spacer()
                }
                .foregroundStyle(.white)
                .padding()
                .background(Color.error.opacity(0.8))
                .cornerRadius(AppRadius.lg)
            }
        }
    }
}
