//
//  HorizontalDateList.swift
//  todo-list
//
//  Created by Andrew Fletcher on 07/08/2024.
//

import SwiftUI
import Foundation

struct HorizontalDateList: View {
    let dates = generateDatesFromStartOfYear(numberOfDays: 30)

    var body: some View {
        ScrollViewReader {
            scrollViewProxy in ScrollView(.horizontal, showsIndicators: false) {
                HStack(spacing: 20) { // Adjust spacing as needed
                    ForEach(dates, id: \.self) { date in
                        VStack(spacing: 5) { // Adjust spacing between day and number
                            Text(getDayOfWeek(date)) // Get day of the week
                                .font(.caption)
                                .foregroundColor(isToday(date) ? .black : .gray) // Day of the week color

                            Text(getDayNumber(date))
                                .bold()
                                .frame(width: 25, height: 25)
                                .opacity(isToday(date) ? 1 : 0.5)
                                .padding(4)
                                .background(isToday(date) ? Color.gray.opacity(0.1) : Color.clear)
                                .cornerRadius(8)
                        }
                        .id(date) // Assign a unique ID for each date
                    }
                }
                .padding()
                .onAppear {
                    if let todayDate = dates.first(where: { isToday($0) }) {
                        // Scroll to today's date when the view appears
                        scrollViewProxy.scrollTo(todayDate, anchor: .center)
                    }
                }
            }
            .navigationTitle("Dates List")
        }
    }
}

// Helper functions to get day of the week and day number

func generateDatesFromStartOfYear(numberOfDays: Int) -> [Date] {
    let calendar = Calendar.current
    let currentYear = calendar.component(.year, from: Date())
    
    // Get the first day of the current year
    let startOfYearComponents = DateComponents(year: currentYear, month: 1, day: 1)
    guard let startDate = calendar.date(from: startOfYearComponents) else {
        return [] // Return an empty array if start date cannot be determined
    }
    
    // Calculate the number of days from the start of the year to today
    let daysSinceStartOfYear = calendar.dateComponents([.day], from: startDate, to: Date()).day ?? 0
    
    // Generate an array of dates from the start of the year
    var dates = [Date]()
    for i in 0...(daysSinceStartOfYear + numberOfDays) {
        if let date = calendar.date(byAdding: .day, value: i, to: startDate) {
            dates.append(date)
        }
    }
    return dates
}

func getDayOfWeek(_ date: Date) -> String {
    let formatter = DateFormatter()
    formatter.dateFormat = "E" // Abbreviated day of the week, e.g., "Wed"
    return formatter.string(from: date)
}

func getDayNumber(_ date: Date) -> String {
    let formatter = DateFormatter()
    formatter.dateFormat = "d" // Day number, e.g., "7"
    return formatter.string(from: date)
}

// Function to check if a given date is today
func isToday(_ date: Date) -> Bool {
    Calendar.current.isDateInToday(date)
}
