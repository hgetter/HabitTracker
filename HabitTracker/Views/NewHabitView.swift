//
//  HabitView.swift
//  HabitTracker
//
//  Created by Harrison Getter on 11/29/23.
//

import SwiftUI

struct NewHabitView: View {
    @StateObject var thisHabit: Habit
    @FocusState private var titleFieldIsFocused: Bool
    
    @State var title : String = ""
    @State private var notifyMe: Bool = false
    @State private var notificationTime: Date = Date()
    @State private var previousNotificationTime: Date = Date()
    
    var body: some View {
        
        VStack {
                Form {
                    TextField("Title", text: $title)
                        .font(.custom("ChalkboardSE-Bold", size: 28))
                        .onChange(of: title) { newValue in
                            validateTitle(input: newValue)
                        }
                    
                    
                    Toggle("Notify me", isOn: $notifyMe)
                        .onChange(of: notifyMe) { newValue in
                            validateToggle(notifyMe: newValue)
                        }
                    
                    if notifyMe {
                        Section(header: Text("Time of Reminder")) {
                            DatePicker("Notification Time", selection: $notificationTime, displayedComponents: .hourAndMinute)
                                .onChange(of: notificationTime) { newValue in
                                    if newValue != previousNotificationTime {
                                        validateTime(notificationTime: newValue)
                                        previousNotificationTime = newValue
                                    }
                                }
                                .datePickerStyle(WheelDatePickerStyle())
                                .frame(height: 80)
                        }
                    }
                }
                .padding()
                .navigationBarTitle("New Habit")
            }
    }
    
    private func validateTitle(input: String) {
        thisHabit.title = input
    }
    private func validateToggle(notifyMe: Bool){
        print("toggle")
        thisHabit.notifyMe = notifyMe
    }
    private func validateTime(notificationTime: Date){
        print("Time")
        thisHabit.notificationTime = notificationTime
    }
}


struct NewHabitView_Previews: PreviewProvider {
    static var previews: some View {
        NewHabitView(thisHabit: Habit.nilHabit)
    }
}
