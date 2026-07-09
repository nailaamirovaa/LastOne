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
        ZStack {
            VStack(alignment: .leading, spacing: 32) {
                Text("Insights")
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
                .presentationDragIndicator(.hidden)
                .interactiveDismissDisabled()
            
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
    
    private var contentView: some View {
        
        
        ScrollView(showsIndicators: false) {
            VStack(alignment: .leading, spacing: 32) {
                triggerAnalysisSection
                recommendationSection
            }
        }
    }
    
    private var triggerAnalysisSection: some View {
        VStack(spacing: 12) {

            if viewModel.isLoading {

                ProgressView()
                    .frame(maxWidth: .infinity)
                    .padding(.vertical, 40)

            } else {

                ForEach(viewModel.triggerStats, id: \.triggerID) { trigger in

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
                    Text(LocalizedStringKey(viewModel.recommendation?.title ?? ""))
                        .font(.headline)
                        .foregroundStyle(.primaryText)
                    Text(LocalizedStringKey(viewModel.recommendation?.message ?? ""))
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
            Text(LocalizedStringKey(name))
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
