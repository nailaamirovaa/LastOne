import SwiftUI

struct SplashView: View {
    var body: some View {
        ZStack {
            Color.appBackground.ignoresSafeArea()
            
            VStack(spacing: 24) {
                Image(systemName: "bolt.heart.fill")
                    .font(.system(size: 80))
                    .foregroundStyle(.primaryAccent)
                
                Text("LastOne")
                    .font(.custom("Newsreader-Bold", size: 42))
                    .foregroundStyle(.primaryText)
                
                ProgressView()
                    .tint(.primaryAccent)
                    .padding(.top, 20)
            }
        }
    }
}
