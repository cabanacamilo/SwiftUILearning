//
//  APIService.swift
//  SwiftUILearning
//
//  Created by Camilo Cabana on 2022/02/14.
//

import Foundation

class APIService {
    
    static let shared = APIService()
    let urlSrring = "https://run.mocky.io/v3/7edffa13-080b-4136-9422-6ab29fabf69d"
    
    func fecthData(completion: @escaping(Expenses?) -> Void) {
        guard let url = URL(string: urlSrring) else {
            completion(nil)
            return
        }
        let jsonDecoder = JSONDecoder()
        if let data = try? Data(contentsOf: url) {
            let decodeData = try? jsonDecoder.decode(Expenses.self, from: data)
            completion(decodeData)
        } else {
            completion(nil)
        }
    }
}
