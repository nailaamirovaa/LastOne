//
//  LogView.swift
//  LastOne
//
//  Created by Naila Amirova on 10.06.26.
//

import SwiftUI

struct LogView: View {
    @Environment(\.dismiss) private var dismiss
    
    @StateObject private var viewModel: LogViewModel
    @State private var showAlert = false
    
    init(getTriggersUseCase: GetTriggersUseCase,getTodayLogsUseCase: GetTodaysLogsUseCase, logCigaretteUseCase: LogCigaretteUseCase, createTriggerUseCase: CreateTriggerUseCase) {
        
        _viewModel = StateObject(
            wrappedValue: LogViewModel(
                getTriggersUseCase: getTriggersUseCase,
                getTodayLogsUseCase: getTodayLogsUseCase,
                logCigaretteUseCase: logCigaretteUseCase,
                createTriggerUseCase: createTriggerUseCase
            )
        )
    }
    
    var body: some View {
        ZStack {
            Color.appBackground.ignoresSafeArea()
            
            if viewModel.isLoading {
                LoadingView()
            } else if let error = viewModel.errorMessage {
                ErrorView(message: error){
                    viewModel.load()
                }
            } else {
               contentView
            }
        }
        .sheet(isPresented: $viewModel.showPaywall, content: {
            PaywallView()
                .presentationDetents([.height(520)])
                .frame(maxWidth: .infinity ,)
                .presentationDragIndicator(.visible)
                
        })
        .sheet(isPresented: $viewModel.showCreateTriggerSheet) {
            
            CreateTriggerSheet(
                triggerName: $viewModel.customTriggerName
            ) {
                Task {
                    await viewModel.createTrigger()
                }
            }
            .presentationDetents([.height(280)])
            .presentationDragIndicator(.visible)
        }
        .appAlert(
            isPresented: $viewModel.showAlert,
            alert: viewModel.alert
        )
        .onAppear {
            viewModel.load()
        }
    }
}


private extension LogView {
    
    var contentView: some View {

        ScrollView {
            
            VStack(alignment: .center, spacing: 32) {
                
                VStack() {
                    Text("You've had today")
                        .foregroundStyle(.tertiaryText)
                        .font(.heading3)
                    
                    HStack(spacing: 8) {
                        Text("\(viewModel.todayCount)")
                            .foregroundStyle(.primaryText)
                            .font(.display)
                        Text("/ \(viewModel.todayCount + viewModel.remaining)")
                            .foregroundStyle(.tertiaryText)
                            .font(.heading3)
                    }
                }
                
                LogProgressButton {
                    viewModel.logCigarette()
                }
                
                statsSection
                
                triggerSection
                
                Spacer(minLength: 120)
            }
            .padding(24)
        }
        
    }
    
    var statsSection: some View {
        
        HStack(spacing: AppSpacing.md) {
            
            LogStatCard(
                title: "last_one",
                value: viewModel.lastLogText
            )

            LogStatCard(
                title: "left_today",
                value: "\(viewModel.remaining)",
                valueColor: .primaryAccent
            )
        }
    }

    var triggerSection: some View {

        VStack(alignment: .leading, spacing: AppSpacing.md) {

            Text("whats_trigger")
                .font(.headline)
                .foregroundStyle(.secondaryText)

            FlowLayout(spacing: 12) {

                ForEach(viewModel.triggers, id: \.id) { trigger in

                    TriggerChip(
                        title: trigger.name,
                        isSelected: viewModel.selectedTrigger?.id == trigger.id
                    ) {

                        if viewModel.selectedTrigger?.id == trigger.id {
                            viewModel.selectedTrigger = nil
                        } else {
                            viewModel.selectedTrigger = trigger
                        }
                    }
                }
                
                Button {
                    if UserDefaults.standard.object(forKey: "subscription") as! String == "PREMIUM" {
                        viewModel.showCreateTriggerSheet = true
                    } else{
                        viewModel.showPaywall = true
                    }
                } label: {
                    Label("Custom", systemImage: "plus")
                        .foregroundStyle(.tertiaryText)
                }
                .clipShape(Capsule())
            }
        }
    }
}
