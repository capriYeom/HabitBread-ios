//
//  APIManager.swift
//  HabitBread
//
//  Created by 염준우 on 2020/12/30.
//

import Alamofire

class APIManager {
    static let shared: APIManager = APIManager()
    
    private var request: DataRequest? {
        didSet {
            oldValue?.cancel()
        }
    }
    
    private var reachability: NetworkReachabilityManager!
    
    private init() {
        monitorReachability()
    }
    
    private func monitorReachability() {
        reachability = NetworkReachabilityManager(host: "www.apple.com")
        
        reachability.startListening(onUpdatePerforming: { status in
            print("Reachabiliyt Status Chaned: \(status)")
        })
    }
    
    func getRankings(completionHandler: @escaping (Result<Rank, Error>) -> Void) {
        self.request = AF.request("\(Config.baseURL)/ranking", headers: Config.baseHeaders)
        self.request?.responseDecodable(completionHandler: { (response: DataResponse<Rank, AFError>) in
            switch response.result {
            case .success(let rank):
                completionHandler(.success(rank))
            case .failure(let error):
                completionHandler(.failure(error))
            }
        })
    }
    
    func getAllHabits(completionHandler: @escaping (Result<HabitResponse, Error>)-> Void) {
        self.request = AF.request("\(Config.baseURL)/habits", headers: Config.baseHeaders)
        self.request?.responseDecodable(completionHandler: { (response: DataResponse<HabitResponse, AFError>) in
            switch response.result {
            case .success(let response):
                completionHandler(.success(response))
            case .failure(let error):
                completionHandler(.failure(error))
            }
        })
    }
}
