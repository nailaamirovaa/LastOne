//
//  FlowLayout.swift
//  LastOne
//
//  Created by Naila Amirova on 10.06.26.
//

import SwiftUI

struct FlowLayout<Content: View>: View {

    let spacing: CGFloat
    let content: Content

    init(
        spacing: CGFloat = 12,
        @ViewBuilder content: () -> Content
    ) {
        self.spacing = spacing
        self.content = content()
    }

    var body: some View {

        LazyVGrid(
            columns: [
                GridItem(
                    .adaptive(minimum: 90),
                    spacing: spacing
                )
            ],
            alignment: .leading,
            spacing: spacing
        ) {
            content
        }
    }
}
