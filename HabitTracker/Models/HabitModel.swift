//
//  HabitModel.swift
//  HabitTracker
//
//  Created by Harrison Getter on 11/29/23.
//

import Foundation

class Habit: Identifiable, ObservableObject{
    var title : String
    var completedList: [Date]
    
    
    // Notification Vars
    var notifyMe: Bool = false
    var notificationTime: Date
    
    
    init(title: String, completedList: [Date], notifyMe: Bool, notificationTime: Date) {
        self.title = title
        self.completedList = completedList
        self.notifyMe = notifyMe
        self.notificationTime = notificationTime
    }
}

extension Habit {
    static let nilHabit: Habit = Habit(title: "", completedList: [], notifyMe: false, notificationTime : Date.now)
}
