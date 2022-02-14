//
//  Expenses.swift
//  SwiftUILearning
//
//  Created by Camilo Cabana on 2022/02/14.
//

import Foundation

struct Expenses: Codable {
    
    var expenses: [Expense]?
    
    enum CodingKeys: String, CodingKey {
        case expenses
    }
}

struct Expense: Codable, Identifiable {
    
    var id: String?
    var merchant: String?
    var amountCents: Int?
    var status: String?
    var paymentMethod: String?
    
    enum CodingKeys: String, CodingKey {
        case id
        case merchant
        case amountCents = "amount_cents"
        case status
        case paymentMethod = "payment_method"
    }
}
