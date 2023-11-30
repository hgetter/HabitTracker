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
    
    init(title: String, completedList: [Date]) {
        self.title = title
        self.completedList = completedList
    }
}
