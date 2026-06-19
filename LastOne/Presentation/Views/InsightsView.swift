//
//  InsightsView.swift
//  LastOne
//
//  Created by Naila Amirova on 09.06.26.
//

import SwiftUI

struct InsightsView: View {
    
    @StateObject private var viewModel: InsightsViewModel
    
    @State private var showPaywall = false
    
    init(
        getTriggerAnalysisUseCase: GetTriggerAnalysisUseCase
    ) {
        
        _viewModel = StateObject(
            wrappedValue: InsightsViewModel(
                getTriggerAnalysisUseCase: getTriggerAnalysisUseCase
            )
        )
    }
    
    
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
        .onAppear() {
            viewModel.load()
            if UserDefaults.standard.object(forKey: "subscription") as! String == "FREE" {
                withAnimation {
                    showPaywall = true
                }
            }
        }
        .sheet(isPresented: $showPaywall, content: {
            PaywallView()
                .presentationDetents([.height(520)])
                .frame(maxWidth: .infinity ,)
                .presentationDragIndicator(.visible)
            
        })
        .overlay {
            if UserDefaults.standard.object(forKey: "subscription") as! String == "FREE" {
                Rectangle()
                    .fill(.ultraThinMaterial)
                    .foregroundStyle(.hairline)
                    .ignoresSafeArea()
            }
        }
        .background(Color.appBackground.ignoresSafeArea())
    }
    
    private var triggerAnalysisSection: some View {
        VStack(spacing: 12) {

            if viewModel.isLoading {

                ProgressView()
                    .frame(maxWidth: .infinity)
                    .padding(.vertical, 40)

            } else {

                ForEach(
                    viewModel.triggerStats,
                    id: \.triggerID
                ) { trigger in

                    TriggerStatRow(
                        name: trigger.triggerName,
                        percentage: trigger.percentage
                    )
                }
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
