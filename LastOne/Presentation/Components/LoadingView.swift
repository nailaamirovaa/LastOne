



import SwiftUI

struct LoadingView: View {
    var body: some View {
        ZStack {
            Color.appBackground
                .ignoresSafeArea()
            
            VStack {
                
                ProgressView()
                    .tint(.primaryAccent)
                    .scaleEffect(1.5)
                
            }
            .padding(.horizontal)
            .padding(.vertical)
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .contentShape(Rectangle())
        .allowsHitTesting(true)
    }
}
