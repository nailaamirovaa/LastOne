//
//  OnboardingStep3View.swift
//  LastOne
//
//  Created by Naila Amirova on 12.06.26.
//

import SwiftUI

// MARK: - Step 3: Reduction Pace Weeks
 
struct OnboardingStep3View: View {
    
    @EnvironmentObject private var languageManager: LanguageManager
    @ObservedObject var viewModel: OnboardingViewModel
    @EnvironmentObject var coordinator: AppCoordinator
 
    private let options = [2, 4, 8, 12]
 
    var body: some View {
        ZStack {
            Color.appBackground.ignoresSafeArea()
 
            VStack(spacing: 0) {
 
                ScrollView {
                    VStack(spacing: AppSpacing.xl) {
                        headerSection
                        introSection
                        counterCard
                    }
                    .padding(.horizontal, 24)
                    .padding(.top)
                }
 
                VStack(spacing: AppSpacing.sm) {
                    primaryButton
                    Text("You can change this anytime.")
                        .font(.footnote)
                        .foregroundStyle(.secondaryText)
                }
                .padding(.horizontal, 24)
                .padding(.bottom, 16)
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
        .onChange(of: viewModel.isCompleted) { completed in
            if completed {
                coordinator.route = .main
            }
        }
    }
 
    private var headerSection: some View {
        VStack(spacing: AppSpacing.md) {
            HStack {
                Text("LASTONE")
                    .font(.headline)
                    .foregroundStyle(.primaryAccent)
                Spacer()
                Text("Step 3 of 3")
                    .font(.bodyText)
                    .foregroundStyle(.secondaryText)
            }
            HStack(spacing: 8) {
                RoundedRectangle(cornerRadius: 4).fill(Color.primaryAccent).frame(height: 8)
                RoundedRectangle(cornerRadius: 4).fill(Color.primaryAccent).frame(height: 8)
                RoundedRectangle(cornerRadius: 4).fill(Color.primaryAccent).frame(height: 8)
            }
        }
    }
 
    private var introSection: some View {
        VStack(alignment: .leading, spacing: AppSpacing.md) {
            Text("How fast do\nyou want to go?")
                .font(.heading1)
                .foregroundStyle(.primaryText)
            Text("Pick your pace — we'll build a weekly plan around it.")
                .font(.bodyText)
                .foregroundStyle(.secondaryText)
        }
    }
 
    private var counterCard: some View {
        HStack {
            Button {
                if let idx = options.firstIndex(of: viewModel.reductionPaceWeeks), idx > 0 {
                    viewModel.reductionPaceWeeks = options[idx - 1]
                }
            } label: {
                Image(systemName: "minus")
                    .font(.title2)
                    .foregroundStyle(.primaryText)
                    .frame(width: 60, height: 60)
                    .background(Color.secondarySurface)
                    .clipShape(Circle())
            }
 
            Spacer()
 
            VStack {
                Text("\(viewModel.reductionPaceWeeks)")
                    .font(.system(size: 72))
                    .foregroundStyle(.primaryText)
                Text("weeks")
                    .font(.bodyText)
                    .foregroundStyle(.secondaryText)
            }
 
            Spacer()
 
            Button {
                if let idx = options.firstIndex(of: viewModel.reductionPaceWeeks), idx < options.count - 1 {
                    viewModel.reductionPaceWeeks = options[idx + 1]
                }
            } label: {
                Image(systemName: "plus")
                    .font(.title2)
                    .foregroundStyle(.primaryText)
                    .frame(width: 60, height: 60)
                    .background(Color.secondarySurface)
                    .clipShape(Circle())
            }
        }
        .padding(.vertical, 32)
        .padding(.horizontal)
        .background {
            RoundedRectangle(cornerRadius: AppRadius.lg).fill(Color.surface)
        }
        .overlay {
            RoundedRectangle(cornerRadius: AppRadius.lg).stroke(Color.hairline, lineWidth: 1)
        }
    }
 
    private var primaryButton: some View {
        Button {
            Task {
                await viewModel.setupProfile()
            }
        } label:{
            Text("Set my plan")
                .font(.headline)
                .foregroundStyle(.black)
                .frame(maxWidth: .infinity)
                .padding()
                .background(Color.primaryAccent)
                .cornerRadius(AppRadius.pill)
        }
    }
}
 
