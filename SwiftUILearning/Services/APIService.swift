//
//  APIService.swift
//  SwiftUILearning
//
//  Created by Camilo Cabana on 2022/02/14.
//

import Foundation

class APIService {
    
    enum APIError: Error {
        case response
    }
    
    static let shared = APIService()
    let urlSrring = "https://run.mocky.io/v3/7edffa13-080b-4136-9422-6ab29fabf69d"

    private func buildURLRequest() -> URLRequest {
        let url = URL(string: urlSrring)!
        return URLRequest(url: url)
    }
    
    func fecthData() async -> Expenses? {
        do {
            let (data, response) = try await URLSession.shared.data(for: buildURLRequest())
            guard (response as? HTTPURLResponse)?.statusCode  == 200 else { throw APIError.response }
            let expenses = try JSONDecoder().decode(Expenses.self, from: data)
            return expenses
        } catch {
            return nil
        }
    }
}
