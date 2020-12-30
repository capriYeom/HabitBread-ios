//
//  Rank.swift
//  HabitBread
//
//  Created by 염준우 on 2020/12/30.
//

import Foundation

struct Rank : Decodable {
    let user: RankUser!
    let userTotalCount: Int
    let rankings: [RankUser]
}

struct RankUser: Decodable {
    let userId: Int
    let userName: String
    let exp: Int
    let achievement: Int
    let rank: String
}
