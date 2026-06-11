//
//  InsightsView.swift
//  LastOne
//
//  Created by Naila Amirova on 09.06.26.
//

import SwiftUI

struct InsightsView: View {
    var body: some View {
        ScrollView(showsIndicators: false) {
            VStack(alignment: .leading, spacing: 32) {
                Text("Insights")
                    .font(.display)
                    .foregroundStyle(.primaryText)
                
                triggerAnalysisSection
                recommendationSection

                Spacer()
            }
            .padding(.horizontal, 24)
            .padding(.top, 30)
        }
        .background(Color.appBackground.ignoresSafeArea())
    }
    
    private var triggerAnalysisSection: some View {
        VStack(alignment: .leading, spacing: 16) {
            Text("Top Triggers")
                .font(.headline)
                .foregroundStyle(.secondaryText)
            
            VStack(spacing: 12) {
                TriggerStatRow(name: "Coffee", percentage: 42)
                TriggerStatRow(name: "Stress", percentage: 28)
                TriggerStatRow(name: "Social", percentage: 15)
            }
        }
    }
    
    private var recommendationSection: some View {
        VStack(alignment: .leading, spacing: 16) {
            Text("Recommendations")
                .font(.headline)
                .foregroundStyle(.secondaryText)
            
            HStack(spacing: 16) {
                Image(systemName: "lightbulb.fill")
                    .font(.title)
                    .foregroundStyle(.primaryAccent)
                
                VStack(alignment: .leading, spacing: 4) {
                    Text("Avoid Coffee")
                        .font(.headline)
                        .foregroundStyle(.primaryText)
                    Text("Try drinking water or going for a 5-minute walk when you feel the urge during coffee.")
                        .font(.footnote)
                        .foregroundStyle(.secondaryText)
                }
            }
            .padding()
            .background(Color.primaryAccent.opacity(0.1))
            .cornerRadius(AppRadius.xl)
        }
    }
}

struct TriggerStatRow: View {
    let name: String
    let percentage: Int
    
    var body: some View {
        HStack {
            Text(name)
                .font(.bodyText)
                .foregroundStyle(.primaryText)
            Spacer()
            Text("\(percentage)%")
                .font(.bodyText)
                .foregroundStyle(.secondaryText)
        }
        .padding()
        .background(Color.surface)
        .cornerRadius(AppRadius.lg)
    }
}
