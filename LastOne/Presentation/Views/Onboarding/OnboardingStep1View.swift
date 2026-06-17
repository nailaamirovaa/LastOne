//
//  OnboardingView.swift
//  LastOne
//
//  Created by Naila Amirova on 09.06.26.
//

import SwiftUI

struct OnboardingStep1View: View {
    
    @ObservedObject var viewModel: OnboardingViewModel

    private var recommendedPerDay: Int {
        max(viewModel.dailyGoalStart - 2, 1)
    }
    
    var body: some View {
        ZStack {
            Color.appBackground
                .ignoresSafeArea()

            VStack(spacing: 0) {

                ScrollView {
                    VStack(spacing: AppSpacing.xl) {
                        headerSection
                        introSection
                        counterCard
                        recommendationCard
                    }
                    .padding(.horizontal, 24)
                    .padding(.top)
                }

                VStack(spacing: AppSpacing.sm) {
                    primaryButton
                    footnote
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
    }
}

// MARK: - HEADER SECTION
private extension OnboardingStep1View {

    var headerSection: some View {
        VStack(spacing: AppSpacing.md) {
            HStack {
                Text("LASTONE")
                    .font(.headline)
                    .foregroundStyle(.primaryAccent)
                Spacer()
                Text("Step 1 of 3")
                    .font(.bodyText)
                    .foregroundStyle(.secondaryText)
            }
            HStack(spacing: 8) {
                RoundedRectangle(cornerRadius: 4).fill(Color.primaryAccent).frame(height: 8)
                RoundedRectangle(cornerRadius: 4).fill(Color.secondarySurface).frame(height: 8)
                RoundedRectangle(cornerRadius: 4).fill(Color.secondarySurface).frame(height: 8)
            }
        }
    }
}

// MARK: - INTRO SECTION
private extension OnboardingStep1View {

    var introSection: some View {
        VStack(alignment: .leading, spacing: AppSpacing.md) {
            Text("How many\non an honest day?")
                .font(.heading1)
                .foregroundStyle(.primaryText)
            Text("No judgment — just a real starting point. We build your plan from here.")
                .font(.bodyText)
                .foregroundStyle(.secondaryText)
        }
    }
}

// MARK: - COUNTER CARD
private extension OnboardingStep1View {

    var counterCard: some View {
        HStack {
            Button {
                if viewModel.dailyGoalStart > 1 { viewModel.dailyGoalStart -= 1 }
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
                Text("\(viewModel.dailyGoalStart)")
                    .font(.system(size: 72))
                    .foregroundStyle(.primaryText)
                Text("cigarettes / day")
                    .font(.bodyText)
                    .foregroundStyle(.secondaryText)
            }

            Spacer()

            Button {
                viewModel.dailyGoalStart += 1
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
}

// MARK: - RECOMMENDATION CARD
private extension OnboardingStep1View {

    var recommendationCard: some View {
        VStack(alignment: .center, spacing: AppSpacing.sm) {
            Text("A gentle taper, not a cliff")
                .font(.headline)
                .foregroundStyle(.primaryText)
            Text("We'll suggest \(recommendedPerDay)/day next week, easing down ~10% at a time.")
                .font(.bodyText)
                .foregroundStyle(.secondaryText)
        }
        .padding(.vertical, 28)
        .padding(.horizontal, 20)
        .background {
            RoundedRectangle(cornerRadius: AppRadius.lg)
                .fill(Color.primaryAccent)
                .opacity(0.12)
        }
        .overlay {
            RoundedRectangle(cornerRadius: AppRadius.lg)
                .stroke(Color.primaryAccent.opacity(0.4), lineWidth: 1)
        }
    }
}

// MARK: - BUTTON
private extension OnboardingStep1View {

    var primaryButton: some View {
        Button {
            viewModel.step += 1
        } label: {
            Text("Set my pace")
                .font(.headline)
                .foregroundStyle(.black)
                .frame(maxWidth: .infinity)
                .padding()
                .background(Color.primaryAccent)
                .cornerRadius(AppRadius.pill)
        }
    }
}

// MARK: - FOOTNOTE
private extension OnboardingStep1View {

    var footnote: some View {
        Text("You can change this anytime.")
            .font(.footnote)
            .foregroundStyle(.secondaryText)
    }
}
