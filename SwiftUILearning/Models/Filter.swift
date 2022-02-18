//
//  Filter.swift
//  SwiftUILearning
//
//  Created by Camilo Cabana on 2022/02/17.
//

import Foundation

struct Filter {
    var expensesType: ExpensesType
    var expensesStatus: [ExpensesStatus]
    var expensesDate: ExpensesDate
    
    static let expensesAppoved = [
        ExpensesStatus(id: 0, status: "All"),
        ExpensesStatus(id: 1, status: "Pending my approval"),
        ExpensesStatus(id: 2, status: "Submitted"),
        ExpensesStatus(id: 3, status: "Approved"),
        ExpensesStatus(id: 4, status: "Reimbursed"),
        ExpensesStatus(id: 5, status: "Processed"),
        ExpensesStatus(id: 6, status: "Rejedted")
    ]
    
    static let myExpenses = [
        ExpensesStatus(id: 0, status: "All"),
        ExpensesStatus(id: 1, status: "Submitted"),
        ExpensesStatus(id: 2, status: "Approved"),
        ExpensesStatus(id: 3, status: "Reimbursed"),
        ExpensesStatus(id: 4, status: "Processed"),
        ExpensesStatus(id: 5, status: "Rejedted")
    ]
}

struct ExpensesStatus: Identifiable {
    var id: Int
    var status: String
}

enum ExpensesType: Int {
    case approver = 0
    case myExpenses = 1
}

struct ExpensesDate {
    var start: Date
    var end: Date
}
