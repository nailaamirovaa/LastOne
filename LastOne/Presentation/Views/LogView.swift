//
//  LogView.swift
//  LastOne
//
//  Created by Naila Amirova on 10.06.26.
//

import SwiftUI

struct LogView: View {
    @Environment(\.dismiss) private var dismiss
    @State private var selectedTriggers: Set<String> = []
    @State private var note: String = ""

    let triggers = [
        "Coffee",
        "Stress",
        "Social",
        "Boredom"
    ]
    
    var body: some View {
        ZStack {
            Color.appBackground.ignoresSafeArea()
            
            ScrollView {
                VStack(alignment: .center, spacing: 32) {
                    
                    LogProgressButton {
                        
                    }
                    
                    statsSection
                    
                    triggerSection
                    
                    Spacer(minLength: 120)
                }
            }
            .padding(24)
        }
    }
}


private extension LogView {
    
    var statsSection: some View {
        
        HStack(spacing: AppSpacing.md) {
            
            LogStatCard(
                title: "Last one",
                value: "2h 14m ago"
            )

            LogStatCard(
                title: "Left today",
                value: "8",
                valueColor: .primaryAccent
            )
        }
    }

    var triggerSection: some View {

        VStack(alignment: .leading, spacing: AppSpacing.md) {

            Text("What's the trigger? (optional)")
                .font(.headline)
                .foregroundStyle(.secondaryText)

            FlowLayout(spacing: 12) {

                ForEach(triggers, id: \.self) { trigger in

                    TriggerChip(
                        title: trigger,
                        isSelected: selectedTriggers.contains(trigger)
                    ) {

                        if selectedTriggers.contains(trigger) {
                            selectedTriggers.remove(trigger)
                        } else {
                            selectedTriggers.insert(trigger)
                        }
                    }
                }
            }
        }
    }
}
