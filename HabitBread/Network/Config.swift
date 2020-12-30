//
//  Config.swift
//  HabitBread
//
//  Created by 염준우 on 2020/12/30.
//

import Alamofire

struct Config {
    static let baseURL = "http://dev.habitbread.com"
    static let baseHeaders: HTTPHeaders = [
        "Authorization": "Bearer eyJhbGciOiJIUzM4NCIsInR5cCI6IkpXVCJ9.eyJ1c2VySWQiOjEsImlhdCI6MTU5MTA4ODk2Nn0.3OVVxz3YJGqd8kAOCRby8ztbFp3TqpZkG5Pwwlr6Azeji3lZU0_-l8YSWO8dIrOy"
    ]
}
