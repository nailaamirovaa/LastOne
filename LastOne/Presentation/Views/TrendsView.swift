//
//  TrendsView.swift
//  LastOne
//
//  Created by Naila Amirova on 09.06.26.
//

import SwiftUI

struct TrendsView: View {
    @State private var selectedRange: TrendRange = .week

    var body: some View {
        ScrollView(showsIndicators: false) {
            VStack(alignment: .leading, spacing: 24) {
    
                Text("Trends")
                    .font(.display)
                    .foregroundStyle(.primaryText)
                
                rangePicker
                
                weeklySummaryCard
                
                miniStats
                
                paceCard

                Spacer(minLength: 96)
            }
            .padding(.horizontal, 24)
            .padding(.top, 30)
        }
        .background(Color.appBackground.ignoresSafeArea())
    }
}

private extension TrendsView {
    
    var rangePicker: some View {
        HStack(spacing: 0) {
            ForEach(TrendRange.allCases, id: \.self) { range in
                Button {
                    selectedRange = range
                } label: {
                    Text(range.title)
                        .font(.system(size: 17, weight: .semibold))
                        .foregroundStyle(selectedRange == range ? Color.primaryText : Color.secondaryText)
                        .frame(maxWidth: .infinity)
                        .frame(height: 48)
                        .background {
                            if selectedRange == range {
                                Capsule()
                                    .fill(Color.surface)
                                    .shadow(color: .black.opacity(0.14), radius: 8, y: 4)
                            }
                        }
                }
                .buttonStyle(.plain)
            }
        }
        .padding(4)
        .background(Color.secondarySurface)
        .clipShape(Capsule())
    }

    var weeklySummaryCard: some View {
        VStack(alignment: .leading, spacing: 28) {
            HStack {
                VStack(alignment: .leading, spacing: 2) {
                    Text("Avg / day this week")
                        .font(.callout)
                        .foregroundStyle(.secondaryText)

                    Text("12.9")
                        .font(.custom("Newsreader-Medium", size: 56))
                        .foregroundStyle(.primaryText)
                }

                Spacer()

                Text("-18%")
                    .font(.system(size: 17, weight: .medium))
                    .foregroundStyle(.primaryAccent)
                    .padding(.horizontal, 24)
                    .frame(height: 44)
                    .background(Color.primaryAccent.opacity(0.12))
                    .clipShape(Capsule())
            }

            WeeklyBarChart()
        }
        .padding(24)
        .background(Color.surface)
        .cornerRadius(AppRadius.xl)
    }

    var miniStats: some View {
        HStack(spacing: 14) {
            StatTile(title: "vs last week", value: "-2.8", valueColor: .success)
            StatTile(title: "Under budget", value: "6 / 7 days", valueColor: .primaryText)
        }
    }

    var paceCard: some View {
        HStack(spacing: 22) {
            Image(systemName: "bolt.fill")
                .font(.system(size: 42, weight: .bold))
                .foregroundStyle(.primaryAccent)

            VStack(alignment: .leading, spacing: 2) {
                Text("At this pace you'll reach")
                    .font(.callout)
                    .foregroundStyle(.secondaryText)

                HStack(alignment: .firstTextBaseline, spacing: 4) {
                    Text("9/day")
                        .font(.headline)
                        .foregroundStyle(.primaryText)

                    Text("in about 4 weeks.")
                        .font(.callout)
                        .foregroundStyle(.secondaryText)
                }
            }
        }
        .frame(maxWidth: .infinity, alignment: .leading)
        .padding(24)
        .background(Color.primaryAccent.opacity(0.10))
        .cornerRadius(AppRadius.xl)
        .overlay {
            RoundedRectangle(cornerRadius: AppRadius.xl)
                .stroke(Color.primaryAccent.opacity(0.45), lineWidth: 1)
        }
    }
}

enum TrendRange: CaseIterable {
    case week, month, year
    var title: String {
        switch self {
        case .week: return "Week"
        case .month: return "Month"
        case .year: return "Year"
        }
    }
}

struct WeeklyBarChart: View {
    var body: some View {
        HStack(alignment: .bottom, spacing: 16) {
            ForEach(0..<7) { index in
                Capsule()
                    .fill(index == 6 ? Color.primaryAccent : Color.secondarySurface)
                    .frame(width: 24, height: CGFloat.random(in: 40...140))
            }
        }
        .frame(height: 160)
        .frame(maxWidth: .infinity)
    }
}
