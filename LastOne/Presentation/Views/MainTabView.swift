//
//  MainTabView.swift
//  LastOne
//
//  Created by Naila Amirova on 09.06.26.
//

import SwiftUI

struct MainTabView: View {

    @State private var selectedTab: MainTab = .today

    var body: some View {

        ZStack(alignment: .bottom) {

            activeContent

            CustomTabBar(selected: $selectedTab)
        }
        .navigationBarBackButtonHidden(true)
        .toolbar(.hidden, for: .navigationBar)
        .ignoresSafeArea(.keyboard, edges: .bottom)
    }

    @ViewBuilder
    private var activeContent: some View {
        switch selectedTab {
        case .today:
            TodayView()

        case .trends:
            TrendsView()

        case .add:
            LogView()

        case .insights:
            InsightsView()

        case .you:
            ProfileView()
        }
    }
}


    
