//
//  ErrorView.swift
//  LastOne
//
//  Created by Naila Amirova on 19.06.26.
//

import Foundation
import SwiftUI

struct ErrorView: View {
    
    @State var message: String
    
    let onRetry: () -> Void
    
    var body: some View {
        ZStack {
            Color.appBackground
                .ignoresSafeArea()
            
            VStack(spacing: 12) {
                Spacer()
                
                Image(systemName: "exclamationmark.triangle")
                    .font(.system(size: 48))
                    .foregroundStyle(.primaryAccent)
                
                Text(message)
                    .font(.headline)
                    .foregroundStyle(.primaryText)
                    .multilineTextAlignment(.center)
                
                Button("Try Again") {
                    onRetry()
                }
                .buttonStyle(.borderedProminent)
                .tint(.primaryAccent)
                
                Spacer()
            }
            
        }
    }
    
    
}
