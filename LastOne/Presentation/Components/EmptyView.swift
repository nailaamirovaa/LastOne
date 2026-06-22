//
//  EmptyView.swift
//  LastOne
//
//  Created by Naila Amirova on 19.06.26.
//

import Foundation
import SwiftUI

struct EmptyView: View {
    
    var body: some View {
        ZStack {
            
            Color.appBackground
                .ignoresSafeArea()
            
            VStack(spacing: 12) {
                Spacer()
                
                Image(systemName: "chart.bar.xaxis")
                    .font(.system(size: 48))
                    .foregroundStyle(.secondaryText)
                
                Text("No data available")
                    .font(.headline)
                    .foregroundStyle(.secondaryText)
                
                Spacer()
            }
            .frame(maxWidth: .infinity)
            .frame(height: 300)
        }
    }
}
