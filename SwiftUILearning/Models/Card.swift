//
//  Card.swift
//  SwiftUILearning
//
//  Created by Camilo Cabana on 2022/03/02.
//

import Foundation
import SwiftUI

struct Card: Identifiable, Equatable {
    
    static func ==(lhs: Card, rhs: Card) -> Bool {
        return lhs.color == rhs.color && lhs.id == rhs.id && lhs.expenses == rhs.expenses
    }
    
    var id: Int
    var color: Color
    var type: String
    var expenses: [CardExpense]
    
    
    static let cards = [
        Card(id: 0, color: .yellow, type: "American Express", expenses: [
            CardExpense(id: 0, value: "¥1.000", date: "20/01/22"),
            CardExpense(id: 1, value: "¥500", date: "19/01/22")
        ]),
        Card(id: 1, color: .blue, type: "Visa", expenses: [
            CardExpense(id: 0, value: "¥1.000", date: "20/01/22"),
            CardExpense(id: 1, value: "¥500", date: "19/01/22"),
            CardExpense(id: 2, value: "¥1.500", date: "18/01/22")
        ]),
        Card(id: 2, color: .red, type: "Master", expenses: [
            CardExpense(id: 0, value: "¥1.000", date: "20/01/22"),
            CardExpense(id: 1, value: "¥500", date: "19/01/22"),
            CardExpense(id: 2, value: "¥1.500", date: "18/01/22"),
            CardExpense(id: 3, value: "¥2.500", date: "17/01/22")
        ])
    ]
}

struct CardExpense: Identifiable, Equatable {
    
    static func ==(lhs: CardExpense, rhs: CardExpense) -> Bool {
        return lhs.value == rhs.value && lhs.id == rhs.id && lhs.date == rhs.date
    }
    
    var id: Int
    var value: String
    var date: String
}
