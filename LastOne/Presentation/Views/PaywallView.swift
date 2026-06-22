

import SwiftUI

struct PaywallView: View {
    
    @EnvironmentObject private var coordinator: AppCoordinator
    @Environment(\.dismiss) private var dismiss
    
    @State var showUpgrade: Bool = false

    var body: some View {

        VStack(spacing: 32) {

            VStack(spacing: 20) {

                ZStack {

                    Circle()
                        .fill(Color.primaryAccent.opacity(0.15))
                        .frame(width: 100, height: 100)

                    Image(systemName: "bolt.heart.fill")
                        .font(.system(size: 48))
                        .foregroundStyle(.primaryAccent)
                }

                VStack(spacing: 12) {

                    Text("Unlock LastOne+")
                        .font(.custom("Newsreader-Bold", size: 34))
                        .foregroundStyle(.primaryText)

                    Text("Insights are available only in LastOne+. Get detailed analysis of your triggers and progress.")
                        .font(.bodyText)
                        .foregroundStyle(.secondaryText)
                        .multilineTextAlignment(.center)
                        .padding(.horizontal, 24)
                }
            }

            VStack(spacing: 16) {

                Button {

                    showUpgrade = true

                } label: {

                    Text("Upgrade Now")
                        .font(.headline)
                        .foregroundStyle(.black)
                        .frame(maxWidth: .infinity)
                        .frame(height: 56)
                        .background(Color.primaryAccent)
                        .clipShape(Capsule())
                }

                Button {
                    dismiss()
                    coordinator.selectedTab = .today
                } label: {

                    Text("Later")
                        .font(.headline)
                        .foregroundStyle(.secondaryText)
                        .frame(maxWidth: .infinity)
                        .frame(height: 56)
                }
            }

            Spacer()
        }
        .padding(.horizontal, 24)
        .padding(.top, 32)
        .presentationBackground(Color.surface)
        .sheet(isPresented: $showUpgrade) {
            UpgradeView()
        }
    }
}
