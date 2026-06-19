import SwiftUI


/*
struct PaywallView: View {
    @Binding var isPresented: Bool
    
    var body: some View {
        VStack(spacing: 32) {
            // Grabber
            Capsule()
                .fill(Color.secondaryText.opacity(0.3))
                .frame(width: 40, height: 5)
                .padding(.top, 12)
            
            VStack(spacing: 20) {
                // Icon
                ZStack {
                    Circle()
                        .fill(Color.primaryAccent.opacity(0.15))
                        .frame(width: 100, height: 100)
                    
                    Image(systemName: "bolt.heart.fill")
                        .font(.system(size: 48))
                        .foregroundStyle(.primaryAccent)
                }
                .padding(.top, 10)
                
                // Content
                VStack(spacing: 12) {
                    Text("Unlock LastOne+")
                        .font(.custom("Newsreader-Bold", size: 34))
                        .foregroundStyle(.primaryText)
                    
                    Text("Insights are available only in LastOne+. Get detailed analysis of your triggers and progress.")
                        .font(.bodyText)
                        .foregroundStyle(.secondaryText)
                        .multilineTextAlignment(.center)
                        .padding(.horizontal, 40)
                }
            }
            
            // Buttons
            VStack(spacing: 16) {
                Button {
                    // Upgrade logic
                } label: {
                    Text("Upgrade Now")
                        .font(.headline)
                        .foregroundStyle(.black)
                        .frame(maxWidth: .infinity)
                        .frame(height: 56)
                        .background(Color.primaryAccent)
                        .clipShape(Capsule())
                }
                .shadow(color: Color.primaryAccent.opacity(0.3), radius: 10, y: 5)
                
                Button {
                    isPresented = false
                } label: {
                    Text("Later")
                        .font(.headline)
                        .foregroundStyle(.secondaryText)
                        .frame(maxWidth: .infinity)
                        .frame(height: 56)
                }
            }
            .padding(.horizontal, 24)
            .padding(.bottom, 40)
        }
        .frame(maxWidth: .infinity)
        .background(
            Color.surface
        )
        .ignoresSafeArea(edges: .bottom)
        .clipShape(RoundedCorner(radius: 40, corners: [.topLeft, .topRight]))
        .shadow(color: .black.opacity(0.3), radius: 20, y: -10)
    }
}


struct RoundedCorner: Shape {
    var radius: CGFloat = .infinity
    var corners: UIRectCorner = .allCorners

    func path(in rect: CGRect) -> Path {
        let path = UIBezierPath(roundedRect: rect, byRoundingCorners: corners, cornerRadii: CGSize(width: radius, height: radius))
        return Path(path.cgPath)
    }
}

*/

import SwiftUI

struct PaywallView: View {

    @Environment(\.dismiss) private var dismiss

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

                    // Upgrade Logic

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
    }
}
