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
    let description: String?
    let dayOfWeek: String
    let percent: Int
    let commitHistory: [History]
}

struct HabitListResponse: Decodable {
    let comment: String
    let habits: [Habit]?
}

struct HabitDetailResponse: Decodable {
    let habit: HabitDetail
    let commitFullCount: Int
    let comparedToLastMonth: Int
}

struct HabitDetail: Decodable {
    let habitId: Int
    let userId: Int
    let title: String
    let description: String?
    let category: String?
    let dayOfWeek: String
    let alarmTime: String?
    let continuousCount: Int
    let commitHistory: [History]
}

struct History: Decodable {
    let createdAt: String
}
