//
//  View+Alert.swift
//  LastOne
//
//  Created by Naila Amirova on 29.06.26.
//

import SwiftUI

extension View {
    func appAlert(
        isPresented: Binding<Bool>,
        alert: AppAlert
    ) -> some View {
        self.alert(alert.title, isPresented: isPresented) {
            Button("OK") { }
        } message: {
            Text(alert.message)
        }
    }
}
