//
//  ProfileView.swift
//  LastOne
//
//  Created by Naila Amirova on 09.06.26.
//

import SwiftUI

struct ProfileView: View {
    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 32) {
                Text("Settings")
                    .font(.display)
                    .foregroundStyle(.primaryText)
                
                settingsSection
                planSection
                dangerZone

                Spacer()
            }
            .padding(.horizontal, 24)
            .padding(.top, 30)
        }
        .background(Color.appBackground.ignoresSafeArea())
    }
    
    private var settingsSection: some View {
        VStack(alignment: .leading, spacing: 16) {
            Text("Your Profile")
                .font(.headline)
                .foregroundStyle(.secondaryText)
            
            VStack(spacing: 0) {
                HStack {
                    Text("Starting Goal")
                        .foregroundStyle(.tertiaryText)
                    Spacer()
                    Text("20 / day")
                        .foregroundStyle(.secondaryText)
                }
                .padding()
                
                Divider().background(Color.hairline).padding(.horizontal)
                
                HStack {
                    Text("Join Date")
                        .foregroundStyle(.tertiaryText)
                    Spacer()
                    Text("08.06")
                        .foregroundStyle(.secondaryText)
                }
                .padding()
            }
            .background(Color.surface)
            .cornerRadius(AppRadius.lg)
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
                // Action
            } label: {
                HStack {
                    Image(systemName: "trash.fill")
                    Text("Reset All Progress")
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
