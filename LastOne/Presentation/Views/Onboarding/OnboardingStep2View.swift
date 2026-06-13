//
//  OnboardingStep2View.swift
//  LastOne
//
//  Created by Naila Amirova on 12.06.26.
//


import SwiftUI
 
// MARK: - Step 2: Daily Goal Final
 
struct OnboardingStep2View: View {
    
    @ObservedObject var viewModel: OnboardingViewModel
 
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
    }
 
    private var headerSection: some View {
        VStack(spacing: AppSpacing.md) {
            HStack {
                Text("LASTONE")
                    .font(.headline)
                    .foregroundStyle(.primaryAccent)
                Spacer()
                Text("Step 2 of 3")
                    .font(.bodyText)
                    .foregroundStyle(.secondaryText)
            }
            HStack(spacing: 8) {
                RoundedRectangle(cornerRadius: 4).fill(Color.primaryAccent).frame(height: 8)
                RoundedRectangle(cornerRadius: 4).fill(Color.primaryAccent).frame(height: 8)
                RoundedRectangle(cornerRadius: 4).fill(Color.secondarySurface).frame(height: 8)
            }
        }
    }
 
    private var introSection: some View {
        VStack(alignment: .leading, spacing: AppSpacing.md) {
            Text("Where do you\nwant to land?")
                .font(.heading1)
                .foregroundStyle(.primaryText)
            Text("Set your target — how many cigarettes per day is your goal.")
                .font(.bodyText)
                .foregroundStyle(.secondaryText)
        }
    }
 
    private var counterCard: some View {
        HStack {
            Button {
                if viewModel.dailyGoalFinal > 0 { viewModel.dailyGoalFinal -= 1 }
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
                Text("\(viewModel.dailyGoalFinal)")
                    .font(.system(size: 72))
                    .foregroundStyle(.primaryText)
                Text("cigarettes / day")
                    .font(.bodyText)
                    .foregroundStyle(.secondaryText)
            }
 
            Spacer()
 
            Button {
                if viewModel.dailyGoalFinal < viewModel.dailyGoalStart { viewModel.dailyGoalFinal += 1 }
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
            viewModel.step += 1
        } label: {
            Text("This is my goal")
                .font(.headline)
                .foregroundStyle(.black)
                .frame(maxWidth: .infinity)
                .padding()
                .background(Color.primaryAccent)
                .cornerRadius(AppRadius.pill)
        }
    }
}
