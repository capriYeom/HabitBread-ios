//
//  User.swift
//  HabitBread
//
//  Created by 염준우 on 2021/01/01.
//

struct User : Decodable {
    let userId: Int
    let name: String
    let exp: Int
    let percent: Int
    let itemTotalCount: Int
    let createdAt: String
    let updatedAt: String
}
