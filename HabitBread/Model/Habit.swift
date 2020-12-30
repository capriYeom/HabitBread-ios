//
//  Habit.swift
//  HabitBread
//
//  Created by 염준우 on 2020/12/27.
//

import Foundation

struct Habit: Decodable {
    let habitId: Int
    let title: String
    let description: String
    let dayOfWeek: String
    let commitHistory: [History]
}

struct HabitResponse: Decodable {
    let comment: String
    let habits: [Habit]
}

struct History: Decodable {
    let createdAt: String
}
