//
//  GoogleOAuthResponse.swift
//  HabitBread
//
//  Created by 염준우 on 2021/01/04.
//

struct GoogleOAuthResponse: Decodable {
    let accessToken: String
    let isNewUser: Bool
}
