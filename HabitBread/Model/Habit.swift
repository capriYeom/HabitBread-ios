//
//  Habit.swift
//  HabitBread
//
//  Created by 염준우 on 2020/12/27.
//

import Foundation

struct Habit {
    let habitId: Int
    let title: String
    let description: String
    let dayOfWeek: String
    let commitHistory: [History]
}

struct HabitResponse {
    let comment: String
    let habits: [Habit]
}

struct History {
    let createdAt: String
}
