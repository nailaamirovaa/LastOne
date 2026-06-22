//
//  UpgradeView.swift
//  LastOne
//
//  Created by Naila Amirova on 22.06.26.
//

import SwiftUI


struct UpgradeView: View {

    @Environment(\.dismiss) private var dismiss

    @State private var selectedPlan: SubscriptionPlan = .yearly

    var body: some View {

        ZStack {

            Color.appBackground
                .ignoresSafeArea()

            ScrollView(showsIndicators: false) {

                VStack(alignment: .leading, spacing: 24) {

                    Text("Go further,\nat your own pace.")
                        .font(.system(size: 42, weight: .regular, design: .serif))
                        .foregroundStyle(.primaryText)

                    Text("LastOne+ unlocks the tools that make reduction actually stick.")
                        .font(.body)
                        .foregroundStyle(.secondaryText)

                    featureCard

                    yearlyPlan

                    monthlyPlan

                    Button {

                    } label: {

                        Text("Start 7-day free trial")
                            .font(.headline)
                            .foregroundStyle(.black)
                            .frame(maxWidth: .infinity)
                            .frame(height: 56)
                            .background(Color.primaryAccent)
                            .clipShape(Capsule())
                    }

                    HStack {
                        Spacer()

                        Text("Restore • Terms • Privacy")
                            .font(.footnote)
                            .foregroundStyle(.secondaryText)

                        Spacer()
                    }
                }
                .padding(24)
            }
        }
    }
}


extension UpgradeView {
    
    private var featureCard: some View {

        VStack(spacing: 20) {

            FeatureRow(
                title: "Adaptive taper plans",
                subtitle: "Goals that adjust to your real week."
            )

            Divider()

            FeatureRow(
                title: "Trigger insights",
                subtitle: "See the moments that drive your count."
            )

            Divider()

            FeatureRow(
                title: "Unlimited history",
                subtitle: "Every cigarette, every trend, forever."
            )
        }
        .padding(20)
        .background(Color.surface)
        .clipShape(
            RoundedRectangle(cornerRadius: 24)
        )
    }
    
    private var yearlyPlan: some View {

        PlanCard(
            isSelected: selectedPlan == .yearly,
            title: "Yearly",
            subtitle: "$29.99/yr • $2.50/mo",
            badge: "Save 40%"
        ) {
            selectedPlan = .yearly
        }
    }
    
    private var monthlyPlan: some View {

        PlanCard(
            isSelected: selectedPlan == .monthly,
            title: "Monthly",
            subtitle: "$3.99/mo",
            badge: nil
        ) {
            selectedPlan = .monthly
        }
    }
}
