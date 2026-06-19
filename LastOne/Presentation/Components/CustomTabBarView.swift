import SwiftUI

struct CustomTabBar: View {
    @Binding var selected: MainTab

    var body: some View {
        HStack {
            TabItem(icon: "house.fill", label: "Today", tab: .today, selected: $selected)
            TabItem(icon: "chart.bar.fill", label: "Trends", tab: .trends, selected: $selected)
            
            Spacer().frame(width: 70)
            
            TabItem(
                icon: "lightbulb.fill", 
                label: "Insights", 
                tab: .insights, 
                selected: $selected,
                isPremium: true,
            )
            TabItem(icon: "person.fill", label: "You", tab: .you, selected: $selected)
        }
        .padding(.horizontal, 12)
        .padding(.top, 12)
        .background(Color.surface)
        .overlay(
            Button {
                selected = .add
            } label: {
                ZStack {
                    Circle()
                        .fill(Color.primaryAccent)
                        .frame(width: 68, height: 68)
                    Image(systemName: "plus")
                        .font(.custom("Newsreader-Bold", size: 32))
                        .foregroundStyle(.black)
                }
                .shadow(color: Color.primaryAccent.opacity(0.3), radius: 10, y: 5)
            }
            .offset(y: -20)
        )
    }
}

struct TabItem: View {
    let icon: String
    let label: String
    let tab: MainTab
    @Binding var selected: MainTab
    var isPremium: Bool = false
    
    var body: some View {
        Button {
            selected = tab
        } label: {
            VStack(spacing: 4) {
                Image(systemName: icon)
                    .font(.heading3)
                Text(label)
                    .font(.bodyText)
            }
            .foregroundStyle(selected == tab ? Color.primaryAccent : Color.secondaryText)
            .frame(maxWidth: .infinity)
        }
    }
}
