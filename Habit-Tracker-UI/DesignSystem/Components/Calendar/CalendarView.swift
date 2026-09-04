import SwiftUI

struct CalendarData: Identifiable {
    var id: UUID = UUID()
    var day: String
    var date: Int
    var isCompleted: Bool
    var isSelected: Bool = false

    var dayColor: Color {
        return isSelected ? .white : .textSecondary
    }

    var dateColor: Color {
        return isSelected ? .white : .textPrimary
    }

    var iconName: String {
        return isCompleted ? AppIcon.select : AppIcon.unselect
    }

    var bgColor: Color {
        return isSelected ? Color(.primary) : .clear
    }

    var iconBgColor: Color {
        return isCompleted ? Color.success : Color.white
    }
}

struct CalendarView: View {
    @Binding var dates: [CalendarData]

    
    var didTap: (Int) -> Void
    
    var body: some View {
        HStack {
            
            ForEach(dates.enumerated(), id: \.element.id) { (index, date) in
                VStack(spacing: Spacing.small) {
                    Spacer()
                        .frame(height: 0.5)

                    Text(date.day)
                        .font(.callout)
                        .fontWeight(.medium)
                        .foregroundStyle(date.dayColor)

                    Text("\(date.date)")
                        .font(.title3.bold())
                        .foregroundStyle(date.dateColor)

                    Image(systemName: date.iconName)
                        .resizable()
                        .frame(width: 10, height: 10)
                        .padding(6)
                        .foregroundStyle(.white)
                        .background(
                            Circle()
                                .fill(date.iconBgColor)
                                .stroke(date.isCompleted ? .clear : .black)
                        )

                    Spacer()
                        .frame(height: 2)
                }
                .frame(maxWidth: .infinity)
                .background(
                    RoundedRectangle(cornerRadius: Radius.medium)
                        .fill(date.bgColor)
                )
                .onTapGesture {
                    didTap(index)
                }
            }
        }
        
        
    }
}
