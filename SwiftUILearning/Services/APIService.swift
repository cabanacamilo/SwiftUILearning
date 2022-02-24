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
    private let expensesUrlSrring = "https://run.mocky.io/v3/7edffa13-080b-4136-9422-6ab29fabf69d"
    private let receiptsUrlString = "https://www.flickr.com/services/feeds/photos_public.gne?format=json&nojsoncallback=1"
    
    func fecthExpenses() async -> Expenses? {
        do {
            let (data, response) = try await URLSession.shared.data(from: URL(string: expensesUrlSrring)!)
            guard (response as? HTTPURLResponse)?.statusCode  == 200 else { throw APIError.response }
            return try JSONDecoder().decode(Expenses.self, from: data)
        } catch {
            return nil
        }
    }
    
    func fecthReceipts() async -> Receipts? {
        do {
            let (data, response) = try await URLSession.shared.data(from: URL(string: receiptsUrlString)!)
            guard (response as? HTTPURLResponse)?.statusCode  == 200 else { throw APIError.response }
            return try JSONDecoder().decode(Receipts.self, from: data)
        } catch {
            return nil
        }
    }
}
