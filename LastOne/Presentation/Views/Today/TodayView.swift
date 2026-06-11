//
//  TodayView.swift
//  LastOne
//
//  Created by Naila Amirova on 09.06.26.
//

import SwiftUI

struct TodayView: View {

    var body: some View {

        ZStack {
            Color.appBackground
                .ignoresSafeArea()

            ScrollView(showsIndicators: false) {

                VStack(spacing: AppSpacing.xl) {
                    
                    header

                    progressSection

                    streakCard

                    logSection
                }
                .padding(.horizontal, 24)
                .padding(.top, 16)
                .padding(.bottom, 120)
            }
        }
    }
}

// MARK: - HEADER
private extension TodayView {

    var header: some View {

        HStack(alignment: .top) {

            VStack(alignment: .leading, spacing: 4) {

                Text("Tuesday • Jun 1")
                    .font(.subhead)
                    .foregroundStyle(.secondaryText)

                Text("Good evening, Sam")
                    .font(.headline)
                    .foregroundStyle(.primaryText)
            }

            Spacer()

            Button {

            } label: {

                Image(systemName: "gearshape")
                    .font(.headline)
                    .foregroundStyle(.secondaryText)
                    .frame(width: 56, height: 56)
                    .background(Color.surface)
                    .clipShape(Circle())
            }
        }
    }
}

// MARK: - PROGRESS SECTION
private extension TodayView {

    var progressSection: some View {

        VStack(spacing: AppSpacing.lg) {

            ProgressRingView(
                current: 6,
                target: 14
            )

            Text("8 left — you're pacing well")
                .font(.title3)
                .foregroundStyle(.primaryAccent)
        }
    }
}

// MARK: - STREAK CARD
private extension TodayView {

    var streakCard: some View {

        HStack(spacing: AppSpacing.md) {

            Image(systemName: "flame.fill")
                .font(.title)
                .foregroundStyle(.primaryAccent)
                .frame(width: 64, height: 64)
                .background(
                    Color.primaryAccent.opacity(0.15)
                )
                .clipShape(
                    RoundedRectangle(cornerRadius: 20)
                )

            VStack(
                alignment: .leading,
                spacing: 4
            ) {

                Text("12-day streak")
                    .foregroundStyle(.primaryText)
                    .font(.headline)

                Text("under budget")
                    .font(.bodyText)
                    .foregroundStyle(.secondaryText)
            }

            Spacer()

            Text("12")
                .font(.system(size: 48))
                .foregroundStyle(.primaryAccent)
        }
        .padding(24)
        .background(Color.surface)
        .clipShape(
            RoundedRectangle(
                cornerRadius: AppRadius.lg
            )
        )
        .overlay {
            RoundedRectangle(
                cornerRadius: AppRadius.lg
            )
            .stroke(Color.hairline)
        }
    }
}

// MARK: - LOG SECTION
private extension TodayView {

    var logSection: some View {

        VStack(
            alignment: .leading,
            spacing: AppSpacing.md
        ) {

            HStack {

                Text("TODAY'S LOG")
                    .font(.caption)
                    .tracking(2)
                    .foregroundStyle(.secondaryText)

                Spacer()

                Button("See all") {

                }
                .font(.bodyText)
                .foregroundStyle(.primaryAccent)
            }

            VStack(spacing: AppSpacing.md) {

                LogRowView(
                    time: "7:10 AM",
                    trigger: "Coffee • porch"
                )

                LogRowView(
                    time: "9:32 AM",
                    trigger: "Commute"
                )

                LogRowView(
                    time: "1:15 PM",
                    trigger: "After lunch"
                )
            }
        }
    }
}

// MARK: - LOG ROW
struct LogRowView: View {

    let time: String
    let trigger: String

    var body: some View {

        HStack(spacing: AppSpacing.md) {

            Circle()
                .fill(Color.primaryAccent)
                .frame(width: 12, height: 12)

            VStack(
                alignment: .leading,
                spacing: 4
            ) {

                Text(time)
                    .font(.subhead.bold())
                    .foregroundStyle(.primaryText)

                Text(trigger)
                    .font(.footnote)
                    .foregroundStyle(.secondaryText)
            }

            Spacer()

            Image(systemName: "flame.fill")
                .foregroundStyle(.secondaryText)
        }
        .padding(12)
        .background(Color.surface)
        .clipShape(
            RoundedRectangle(
                cornerRadius: AppRadius.md
            )
        )
        .overlay {
            RoundedRectangle(
                cornerRadius: AppRadius.md
            )
            .stroke(Color.hairline)
        }
    }
}
