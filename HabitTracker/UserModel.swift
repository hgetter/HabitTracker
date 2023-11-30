//
//  UserModel.swift
//  HabitTracker
//
//  Created by Harrison Getter on 11/29/23.
//

import Foundation

class User: Identifiable, ObservableObject {
    var habitList : [Habit]
    
    init(habitList: [Habit]) {
        self.habitList = habitList
    }
}
