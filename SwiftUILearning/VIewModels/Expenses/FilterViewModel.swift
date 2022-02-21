//
//  FilterViewModel.swift
//  SwiftUILearning
//
//  Created by Camilo Cabana on 2022/02/17.
//

import Foundation

class FilterViewModel: ObservableObject {
    
    @Published var expensesType: ExpensesType = .approver
    @Published var fromDate = Date()
    @Published var toDate = Date()
    @Published var expensesStatusList = [ExpensesStatus]()
    @Published var approverExpenseStatus = ExpensesStatus(id: 0, status: "All")
    @Published var myExpenseStatus = ExpensesStatus(id: 0, status: "All")
    
    func expensesTypeHasSelected() {
        switch expensesType {
        case .approver: expensesStatusList = Filter.expensesAppoved
        case .myExpenses: expensesStatusList = Filter.myExpenses
        }
    }
    
    func expensesStatusHasSelected(_ expenseStautus: ExpensesStatus) {
        switch expensesType {
        case .approver:
            self.approverExpenseStatus = expenseStautus
        case .myExpenses:
            self.myExpenseStatus = expenseStautus
        }
        
    }
    
}
